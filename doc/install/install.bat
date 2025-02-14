@echo off
rem  setlocal enabledelayedexpansion enableextensions
set mypath=%0
set mydir=%~dp0
set conda_reqs=%mydir%\conda_requirements_win.txt
set pip_reqs=%mydir%\pip_requirements_win.txt
set default_env_name="e:\scipyenv"
set /P env_name="Enter the full path name of the new environment (no spaces, please, e.g. %default_env_name%): "
if [%env_name%] equ [] set env_name=%default_env_name%
echo Creating conda environment %env_name%
call conda create -y --prefix %env_name% python=3.11 || goto eof
echo Activating conda environment %env_name%
call conda activate %env_name% || goto eof
call conda config --add channels conda-forge || goto eof
rem  call conda install --prefix %env_name% -y --file %conda_reqs%
echo Installing jupyter
call conda install --prefix %env_name% -y jupyter || goto eof
echo Installing jupyter_cms
call conda install --prefix %env_name% -y jupyter_cms || goto eof
echo Installing color schemes for jupyter qtconsole
call conda install --prefix %env_name% -y jupyter_qtconsole_colorschemes || goto eof
echo Installing jupyter themes
call conda install --prefix %env_name% -y jupyterthemes || goto eof
echo Installing numpy
call conda install --prefix %env_name% -y numpy || goto eof
echo Installing matplotlib
call conda install --prefix %env_name% -y matplotlib || goto eof
echo Installing scipy
call conda install --prefix %env_name% -y scipy || goto eof
echo Installing sympy
call conda install --prefix %env_name% -y sympy || goto eof
echo Installing h5py
call conda install --prefix %env_name% -y h5py || goto eof
echo Installing pyqtgraph
call conda install --prefix %env_name% -y pyqtgraph || goto eof
echo Installing pywavelets
call conda install --prefix %env_name% -y PyWavelets || goto eof
echo Installing pandas
call conda install --prefix %env_name% -y pandas || goto eof
echo Installing quantities
call conda install --prefix %env_name% -y quantities || goto eof
echo Installing python-neo
call conda install --prefix %env_name% -y python-neo || goto eof
echo Installing vigra
call conda install --prefix %env_name% -y -c conda-forge vigra || goto eof
echo Installing cmocean
call conda install --prefix %env_name% -y cmocean || goto eof
echo Installing confuse
call conda install --prefix %env_name% -y confuse || goto eof
echo Installing inflect
call conda install --prefix %env_name% -y inflect || goto eof
echo Installing seaborn
call conda install --prefix %env_name% -y seaborn || goto eof
echo Installing pingouin
call conda install --prefix %env_name% -y pingouin || goto eof
echo Installing qimage2ndarray
call conda install --prefix %env_name% -y qimage2ndarray || goto eof
echo Installing pyxdg
call conda install --prefix %env_name% -y pyxdg || goto eof
REM OPTIONAL PACKAGES FROM CONDA
REM call conda install --prefix %env_name% -y qdarkstyle
echo Installing bokeh
call conda install --prefix %env_name% -y bokeh || goto eof
echo Installing scikit-image
call conda install --prefix %env_name% -y scikit-image || goto eof
echo Installing scikit-learn
call conda install --prefix %env_name% -y scikit-learn || goto eof
echo Installing dill
call conda install --prefix %env_name% -y dill || goto eof
echo Installing libNeuroML
call conda install --prefix %env_name% -y libNeuroML || goto eof
echo Installing matlab kernel
call conda install --prefix %env_name% -y matlab_kernel || goto eof
echo Installing octave kernel
call conda install --prefix %env_name% -y octave_kernel || goto eof

echo Installing additional PyPI packages
call pip install -r %pip_reqs% || goto eof

powershell -ExecutionPolicy Bypass -File %mydir%\make_link.ps1 %mydir%  || goto eof
echo Scipyen can now be launched from the desktop icon


:eof
rem  endlocal
