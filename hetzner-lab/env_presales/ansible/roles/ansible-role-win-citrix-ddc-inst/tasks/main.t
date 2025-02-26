---
  - name: Prepare machine for auto-logon to support DDC installation - 1
    ansible.windows.win_regedit:
      path: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
      name: AutoAdminLogon
      data: 1
      state: present

  - name: Prepare machine for auto-logon to support DDC installation - 2
    ansible.windows.win_regedit:
      path: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
      name: DefaultUserName
      data: '{{ ansible_user }}'
      state: present

  - name: Prepare machine for auto-logon to support DDC installation - 3
    ansible.windows.win_regedit:
      path: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
      name: DefaultPassword
      data: '{{ ansible_password }}'
      state: present

  - name: create install folder
    win_file: 
      path: '{{ win_directory_install }}'
      state: directory

  - name: Map SMB share
    win_shell: |
      net use \\10.10.1.22 '{{ smb_share_password }}' /user:'{{ smb_share_username }}'

  - name: Copy Citrix zip to the local disk
    win_copy:
      src: '{{ citrix_ddc_srczipfile }}'
      remote_src: true
      dest: '{{ citrix_ddc_destzipfile }}' 
      force: no

  - name: Unzip ZIP
    community.windows.win_unzip:
      src: '{{ citrix_ddc_destzipfile }}'
      dest: '{{ win_directory_install }}'

  - name: Install DDC Components
    win_package:
      path: "{{ citrix_ddc_exepath }}"
      arguments: "{{ citrix_ddc_params_full }}"
      state: present
      expected_return_code: [0, 3, 3010]
      creates_path: 'C:\Program Files\Citrix\Desktop Studio'
    become: yes
    become_method: runas
    become_flags: logon_type=new_credentials logon_flags=netcredentials_only
    vars:
      ansible_become_user: "{{ citrix_user_admin }}"
      ansible_become_pass: "{{ citrix_password_admin }}"
    register: ddc_install_started

  - name: Pause for 10 minutes
    ansible.builtin.pause:
      minutes: 10

  - name: Wait for Windows Installer process to stop
    community.windows.win_wait_for_process:
      process_name_exact: 'msiexec'
      state: absent
      timeout: 900

  - name: Remove auto-logon reg keys - 1
    ansible.windows.win_regedit:
      path: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
      name: AutoAdminLogon
      state: absent

  - name: Remove auto-logon reg keys - 2
    ansible.windows.win_regedit:
      path: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
      name: DefaultUserName
      state: absent

  - name: Remove auto-logon reg keys - 3
    ansible.windows.win_regedit:
      path: HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
      name: DefaultPassword
      state: absent

  - name: Reboot
    ansible.windows.win_reboot: