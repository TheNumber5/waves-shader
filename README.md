# Description
This is a Unity simple shader that offsets vertices of a 3D model in the y direction according to a composed wave function.
The shader also multiplies the texture color assigned to the 3D model by the current intensity of the wave.

The function used in the shader is:
![Eq](https://user-images.githubusercontent.com/30901594/129145448-66936cde-f735-4340-947f-6d5b69b22280.png)

Where:

A, B are the amplitudes of the waves.

Alpha and beta are the coefficients of the dissipation of the waves, the larger these values are, the more the wave gets dissipated over time.
If alpha or beta are 0, the wave will continue having the initial amplitude. Negative values will cause the wave's amplitude to get larger over time.

D is the distance between the current vertex and the center of the uv, this is done using uv-0.5

F1 and f2 are the frequencies of the waves.

T is the time passed since the start of the simulation.
# Screenshots
![image](https://user-images.githubusercontent.com/30901594/129146270-9f3d19b2-308b-4888-bba4-c5b6cc5a6aaf.png)
![image](https://user-images.githubusercontent.com/30901594/129146299-43e63594-cae5-4363-a8a3-7daa619302df.png)
![image](https://user-images.githubusercontent.com/30901594/129146330-2cd6d5a2-d5e1-4680-9c51-d1b8f06550f6.png)
