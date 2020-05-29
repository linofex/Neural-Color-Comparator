function z=illuminant(ill,wl)
%ILLUMINANT returns the spectral distribution of an illuminant.
%   Z=ILLUMINANT returns the relative spectral distribution of the
%   default illuminant in the default wavelength range. The wavelength range
%   is returned in WL.
%
%   Z=ILLUMINANT(ILL) returns the spectral distribution of the
%   illuminant ILL in the default wavelength range. The wavelength range
%   is returned in WL.
%
%   Z=ILLUMINANT(ILL,WL) returns the distribution at wavelengths
%   specified in WL.
%
%   ILL is a char array, e.g. 'D65', but can also have an observer
%   appended, which is ignored.
%
%   Following ILLUMINANTS are supported by tables:
%      A       http://www.cvrl.org/database/data/cie/Illuminanta.txt
%      C   Handbook of Optics (First Edition, 1978)
%      D65     http://www.cvrl.org/database/data/cie/Illuminantd65.txt
%      F1-F12  http://www.cis.rit.edu/mcsl/online/CIE/Fluorescents.htm
%
%   Other illuminants are calculated:
%      Dnn D-illuminants at nn00 degrees Kelvin
%      Pnn Planck black body illuminant
%      E   CIE E flat illuminant
%
%   See also: MAKECWF

% Part of the OptProp toolbox, $Version: 2.1 $
% Author:  Jerker W�gberg, More Research & DPC, Sweden
% Email: ['jerker.wagberg' char(64) 'more.se']

% $Id: illuminant.m 28 2007-01-29 10:34:32Z jerkerw $

	if nargin<2 || isempty(wl);wl=dwl;end
	if nargin<1; ill=cwf2ill(dcwf); end

	if ischar(ill)
		z=charilluminant(cwf2ill(ill),wl);
	else
		error(illpar('Illuminant specifier must be a char array'));
		end
	lineup(z,wl);

function ill=charilluminant(charill,wl)
	persistent Illuminants
	if isempty(Illuminants)

		StandardIllWl=(300:830)';

		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Illuminant A
		Illuminants.A.wl=StandardIllWl;
		Illuminants.A.Power = [
			0.930483
			0.967643
			1.005970
			1.045490
			1.086230
			1.128210
			1.171470
			1.216020
			1.261880
			1.309100
			1.357690
			1.407680
			1.459100
			1.511980
			1.566330
			1.622190
			1.679590
			1.738550
			1.799100
			1.861270
			1.925080
			1.990570
			2.057760
			2.126670
			2.197340
			2.269800
			2.344060
			2.420170
			2.498140
			2.578010
			2.659810
			2.743550
			2.829280
			2.917010
			3.006780
			3.098610
			3.192530
			3.288570
			3.386760
			3.487120
			3.589680
			3.694470
			3.801520
			3.910850
			4.022500
			4.136480
			4.252820
			4.371560
			4.492720
			4.616310
			4.742380
			4.870950
			5.002040
			5.135680
			5.271890
			5.410700
			5.552130
			5.696220
			5.842980
			5.992440
			6.144620
			6.299550
			6.457240
			6.617740
			6.781050
			6.947200
			7.116210
			7.288110
			7.462920
			7.640660
			7.821350
			8.005010
			8.191670
			8.381340
			8.574040
			8.769800
			8.968640
			9.170560
			9.375610
			9.583780
			9.795100
			10.009600
			10.227300
			10.448100
			10.672200
			10.899600
			11.130200
			11.364000
			11.601200
			11.841600
			12.085300
			12.332400
			12.582800
			12.836600
			13.093800
			13.354300
			13.618200
			13.885500
			14.156300
			14.430400
			14.708000
			14.989100
			15.273600
			15.561600
			15.853000
			16.148000
			16.446400
			16.748400
			17.053800
			17.362800
			17.675300
			17.991300
			18.310800
			18.633900
			18.960500
			19.290700
			19.624400
			19.961700
			20.302600
			20.647000
			20.995000
			21.346500
			21.701600
			22.060300
			22.422500
			22.788300
			23.157700
			23.530700
			23.907200
			24.287300
			24.670900
			25.058100
			25.448900
			25.843200
			26.241100
			26.642500
			27.047500
			27.456000
			27.868100
			28.283600
			28.702700
			29.125300
			29.551500
			29.981100
			30.414200
			30.850800
			31.290900
			31.734500
			32.181500
			32.632000
			33.085900
			33.543200
			34.004000
			34.468200
			34.935800
			35.406800
			35.881100
			36.358800
			36.839900
			37.324300
			37.812100
			38.303100
			38.797500
			39.295100
			39.796000
			40.300200
			40.807600
			41.318200
			41.832000
			42.349100
			42.869300
			43.392600
			43.919200
			44.448800
			44.981600
			45.517400
			46.056300
			46.598300
			47.143300
			47.691300
			48.242300
			48.796300
			49.353300
			49.913200
			50.476000
			51.041800
			51.610400
			52.181800
			52.756100
			53.333200
			53.913200
			54.495800
			55.081300
			55.669400
			56.260300
			56.853900
			57.450100
			58.048900
			58.650400
			59.254500
			59.861100
			60.470300
			61.082000
			61.696200
			62.312800
			62.932000
			63.553500
			64.177500
			64.803800
			65.432500
			66.063500
			66.696800
			67.332400
			67.970200
			68.610200
			69.252500
			69.896900
			70.543500
			71.192200
			71.843000
			72.495900
			73.150800
			73.807700
			74.466600
			75.127500
			75.790300
			76.455100
			77.121700
			77.790200
			78.460500
			79.132600
			79.806500
			80.482100
			81.159500
			81.838600
			82.519300
			83.201700
			83.885600
			84.571200
			85.258400
			85.947000
			86.637200
			87.328800
			88.021900
			88.716500
			89.412400
			90.109700
			90.808300
			91.508200
			92.209500
			92.912000
			93.615700
			94.320600
			95.026700
			95.733900
			96.442300
			97.151800
			97.862300
			98.573900
			99.286400
			100.000000
			100.715000
			101.430000
			102.146000
			102.864000
			103.582000
			104.301000
			105.020000
			105.741000
			106.462000
			107.184000
			107.906000
			108.630000
			109.354000
			110.078000
			110.803000
			111.529000
			112.255000
			112.982000
			113.709000
			114.436000
			115.164000
			115.893000
			116.622000
			117.351000
			118.080000
			118.810000
			119.540000
			120.270000
			121.001000
			121.731000
			122.462000
			123.193000
			123.924000
			124.655000
			125.386000
			126.118000
			126.849000
			127.580000
			128.312000
			129.043000
			129.774000
			130.505000
			131.236000
			131.966000
			132.697000
			133.427000
			134.157000
			134.887000
			135.617000
			136.346000
			137.075000
			137.804000
			138.532000
			139.260000
			139.988000
			140.715000
			141.441000
			142.167000
			142.893000
			143.618000
			144.343000
			145.067000
			145.790000
			146.513000
			147.235000
			147.957000
			148.678000
			149.398000
			150.117000
			150.836000
			151.554000
			152.271000
			152.988000
			153.704000
			154.418000
			155.132000
			155.845000
			156.558000
			157.269000
			157.979000
			158.689000
			159.397000
			160.104000
			160.811000
			161.516000
			162.221000
			162.924000
			163.626000
			164.327000
			165.028000
			165.726000
			166.424000
			167.121000
			167.816000
			168.510000
			169.203000
			169.895000
			170.586000
			171.275000
			171.963000
			172.650000
			173.335000
			174.019000
			174.702000
			175.383000
			176.063000
			176.741000
			177.419000
			178.094000
			178.769000
			179.441000
			180.113000
			180.783000
			181.451000
			182.118000
			182.783000
			183.447000
			184.109000
			184.770000
			185.429000
			186.087000
			186.743000
			187.397000
			188.050000
			188.701000
			189.350000
			189.998000
			190.644000
			191.288000
			191.931000
			192.572000
			193.211000
			193.849000
			194.484000
			195.118000
			195.750000
			196.381000
			197.009000
			197.636000
			198.261000
			198.884000
			199.506000
			200.125000
			200.743000
			201.359000
			201.972000
			202.584000
			203.195000
			203.803000
			204.409000
			205.013000
			205.616000
			206.216000
			206.815000
			207.411000
			208.006000
			208.599000
			209.189000
			209.778000
			210.365000
			210.949000
			211.532000
			212.112000
			212.691000
			213.268000
			213.842000
			214.415000
			214.985000
			215.553000
			216.120000
			216.684000
			217.246000
			217.806000
			218.364000
			218.920000
			219.473000
			220.025000
			220.574000
			221.122000
			221.667000
			222.210000
			222.751000
			223.290000
			223.826000
			224.361000
			224.893000
			225.423000
			225.951000
			226.477000
			227.000000
			227.522000
			228.041000
			228.558000
			229.073000
			229.585000
			230.096000
			230.604000
			231.110000
			231.614000
			232.115000
			232.615000
			233.112000
			233.606000
			234.099000
			234.589000
			235.078000
			235.564000
			236.047000
			236.529000
			237.008000
			237.485000
			237.959000
			238.432000
			238.902000
			239.370000
			239.836000
			240.299000
			240.760000
			241.219000
			241.675000
			242.130000
			242.582000
			243.031000
			243.479000
			243.924000
			244.367000
			244.808000
			245.246000
			245.682000
			246.116000
			246.548000
			246.977000
			247.404000
			247.829000
			248.251000
			248.671000
			249.089000
			249.505000
			249.918000
			250.329000
			250.738000
			251.144000
			251.548000
			251.950000
			252.350000
			252.747000
			253.142000
			253.535000
			253.925000
			254.314000
			254.700000
			255.083000
			255.465000
			255.844000
			256.221000
			256.595000
			256.968000
			257.338000
			257.706000
			258.071000
			258.434000
			258.795000
			259.154000
			259.511000
			259.865000
			260.217000
			260.567000
			260.914000
			261.259000
			261.602000
			];

		Illuminants.C.wl=(320:5:770)';
		Illuminants.C.Power = [
			0.0094
			0.1900
			0.3799
			1.4720
			2.5642
			4.6058
			6.6477
			9.4492
		   12.2507
		   16.3343
		   20.3228
		   26.1159
		   31.3390
		   37.9107
		   45.0142
		   52.3931
		   60.1140
		   68.1956
		   76.5432
		   85.0238
		   93.1623
		  100.4747
		  106.7425
		  111.8233
		  115.3844
		  117.2364
		  117.7587
		  117.3787
		  116.9040
		  117.0940
		  117.5687
		  117.8442
		  117.6637
		  116.7331
		  114.6248
		  111.0160
		  106.4577
		  101.5954
		   97.1509
		   93.8366
		   92.0227
		   91.9088
		   93.0673
		   94.9097
		   96.9610
		   98.7179
		   99.9050
		  100.3512
		  100.0000
		   98.8698
		   97.1509
		   95.1092
		   92.8774
		   90.6267
		   88.5089
		   86.6287
		   85.1852
		   84.3589
		   83.9506
		   83.7512
		   83.6656
		   83.6277
		   83.5706
		   83.4377
		   83.3807
		   83.5612
		   83.7606
		   83.7606
		   83.4756
		   82.8299
		   81.9563
		   81.0066
		   79.7720
		   78.0720
		   76.1633
		   74.3019
		   72.4596
		   70.6172
		   68.7560
		   66.8566
		   64.8622
		   62.9629
		   61.1585
		   59.6391
		   58.4045
		   57.1700
		   56.2204
		   55.5555
		   55.1757
		   55.0807
		   55.2706
			];

		Illuminants.D65.wl=StandardIllWl;
		Illuminants.D65.Power = [
			0.034100
			0.360140
			0.686180
			1.012220
			1.338260
			1.664300
			1.990340
			2.316380
			2.642420
			2.968460
			3.294500
			4.988650
			6.682800
			8.376950
			10.071100
			11.765200
			13.459400
			15.153500
			16.847700
			18.541800
			20.236000
			21.917700
			23.599500
			25.281200
			26.963000
			28.644700
			30.326500
			32.008200
			33.690000
			35.371700
			37.053500
			37.343000
			37.632600
			37.922100
			38.211600
			38.501100
			38.790700
			39.080200
			39.369700
			39.659300
			39.948800
			40.445100
			40.941400
			41.437700
			41.934000
			42.430200
			42.926500
			43.422800
			43.919100
			44.415400
			44.911700
			45.084400
			45.257000
			45.429700
			45.602300
			45.775000
			45.947700
			46.120300
			46.293000
			46.465600
			46.638300
			47.183400
			47.728500
			48.273500
			48.818600
			49.363700
			49.908800
			50.453900
			50.998900
			51.544000
			52.089100
			51.877700
			51.666400
			51.455000
			51.243700
			51.032300
			50.820900
			50.609600
			50.398200
			50.186900
			49.975500
			50.442800
			50.910000
			51.377300
			51.844600
			52.311800
			52.779100
			53.246400
			53.713700
			54.180900
			54.648200
			57.458900
			60.269500
			63.080200
			65.890900
			68.701500
			71.512200
			74.322900
			77.133600
			79.944200
			82.754900
			83.628000
			84.501100
			85.374200
			86.247300
			87.120400
			87.993600
			88.866700
			89.739800
			90.612900
			91.486000
			91.680600
			91.875200
			92.069700
			92.264300
			92.458900
			92.653500
			92.848100
			93.042600
			93.237200
			93.431800
			92.756800
			92.081900
			91.406900
			90.732000
			90.057000
			89.382100
			88.707100
			88.032200
			87.357200
			86.682300
			88.500600
			90.318800
			92.137100
			93.955400
			95.773600
			97.591900
			99.410200
			101.228000
			103.047000
			104.865000
			106.079000
			107.294000
			108.508000
			109.722000
			110.936000
			112.151000
			113.365000
			114.579000
			115.794000
			117.008000
			117.088000
			117.169000
			117.249000
			117.330000
			117.410000
			117.490000
			117.571000
			117.651000
			117.732000
			117.812000
			117.517000
			117.222000
			116.927000
			116.632000
			116.336000
			116.041000
			115.746000
			115.451000
			115.156000
			114.861000
			114.967000
			115.073000
			115.180000
			115.286000
			115.392000
			115.498000
			115.604000
			115.711000
			115.817000
			115.923000
			115.212000
			114.501000
			113.789000
			113.078000
			112.367000
			111.656000
			110.945000
			110.233000
			109.522000
			108.811000
			108.865000
			108.920000
			108.974000
			109.028000
			109.082000
			109.137000
			109.191000
			109.245000
			109.300000
			109.354000
			109.199000
			109.044000
			108.888000
			108.733000
			108.578000
			108.423000
			108.268000
			108.112000
			107.957000
			107.802000
			107.501000
			107.200000
			106.898000
			106.597000
			106.296000
			105.995000
			105.694000
			105.392000
			105.091000
			104.790000
			105.080000
			105.370000
			105.660000
			105.950000
			106.239000
			106.529000
			106.819000
			107.109000
			107.399000
			107.689000
			107.361000
			107.032000
			106.704000
			106.375000
			106.047000
			105.719000
			105.390000
			105.062000
			104.733000
			104.405000
			104.369000
			104.333000
			104.297000
			104.261000
			104.225000
			104.190000
			104.154000
			104.118000
			104.082000
			104.046000
			103.641000
			103.237000
			102.832000
			102.428000
			102.023000
			101.618000
			101.214000
			100.809000
			100.405000
			100.000000
			99.633400
			99.266800
			98.900300
			98.533700
			98.167100
			97.800500
			97.433900
			97.067400
			96.700800
			96.334200
			96.279600
			96.225000
			96.170300
			96.115700
			96.061100
			96.006500
			95.951900
			95.897200
			95.842600
			95.788000
			95.077800
			94.367500
			93.657300
			92.947000
			92.236800
			91.526600
			90.816300
			90.106100
			89.395800
			88.685600
			88.817700
			88.949700
			89.081800
			89.213800
			89.345900
			89.478000
			89.610000
			89.742100
			89.874100
			90.006200
			89.965500
			89.924800
			89.884100
			89.843400
			89.802600
			89.761900
			89.721200
			89.680500
			89.639800
			89.599100
			89.409100
			89.219000
			89.029000
			88.838900
			88.648900
			88.458900
			88.268800
			88.078800
			87.888700
			87.698700
			87.257700
			86.816700
			86.375700
			85.934700
			85.493600
			85.052600
			84.611600
			84.170600
			83.729600
			83.288600
			83.329700
			83.370700
			83.411800
			83.452800
			83.493900
			83.535000
			83.576000
			83.617100
			83.658100
			83.699200
			83.332000
			82.964700
			82.597500
			82.230200
			81.863000
			81.495800
			81.128500
			80.761300
			80.394000
			80.026800
			80.045600
			80.064400
			80.083100
			80.101900
			80.120700
			80.139500
			80.158300
			80.177000
			80.195800
			80.214600
			80.420900
			80.627200
			80.833600
			81.039900
			81.246200
			81.452500
			81.658800
			81.865200
			82.071500
			82.277800
			81.878400
			81.479100
			81.079700
			80.680400
			80.281000
			79.881600
			79.482300
			79.082900
			78.683600
			78.284200
			77.427900
			76.571600
			75.715300
			74.859000
			74.002700
			73.146500
			72.290200
			71.433900
			70.577600
			69.721300
			69.910100
			70.098900
			70.287600
			70.476400
			70.665200
			70.854000
			71.042800
			71.231500
			71.420300
			71.609100
			71.883100
			72.157100
			72.431100
			72.705100
			72.979000
			73.253000
			73.527000
			73.801000
			74.075000
			74.349000
			73.074500
			71.800000
			70.525500
			69.251000
			67.976500
			66.702000
			65.427500
			64.153000
			62.878500
			61.604000
			62.432200
			63.260300
			64.088500
			64.916600
			65.744800
			66.573000
			67.401100
			68.229300
			69.057400
			69.885600
			70.405700
			70.925900
			71.446000
			71.966200
			72.486300
			73.006400
			73.526600
			74.046700
			74.566900
			75.087000
			73.937600
			72.788100
			71.638700
			70.489300
			69.339800
			68.190400
			67.041000
			65.891600
			64.742100
			63.592700
			61.875200
			60.157800
			58.440300
			56.722900
			55.005400
			53.288000
			51.570500
			49.853100
			48.135600
			46.418200
			48.456900
			50.495600
			52.534400
			54.573100
			56.611800
			58.650500
			60.689200
			62.728000
			64.766700
			66.805400
			66.463100
			66.120900
			65.778600
			65.436400
			65.094100
			64.751800
			64.409600
			64.067300
			63.725100
			63.382800
			63.474900
			63.567000
			63.659200
			63.751300
			63.843400
			63.935500
			64.027600
			64.119800
			64.211900
			64.304000
			63.818800
			63.333600
			62.848400
			62.363200
			61.877900
			61.392700
			60.907500
			60.422300
			59.937100
			59.451900
			58.702600
			57.953300
			57.204000
			56.454700
			55.705400
			54.956200
			54.206900
			53.457600
			52.708300
			51.959000
			52.507200
			53.055300
			53.603500
			54.151600
			54.699800
			55.248000
			55.796100
			56.344300
			56.892400
			57.440600
			57.727800
			58.015000
			58.302200
			58.589400
			58.876500
			59.163700
			59.450900
			59.738100
			60.025300
			60.312500
			];
		F=[... F1   F2    F3    F4    F5    F6    F7    F8    F9   F10   F11   F12
			 1.87  1.18  0.82  0.57  1.87  1.05  2.56  1.21  0.90  1.11  0.91  0.96
			 2.36  1.48  1.02  0.70  2.35  1.31  3.18  1.50  1.12  0.63  0.63  0.64
			 2.94  1.84  1.26  0.87  2.92  1.63  3.84  1.81  1.36  0.62  0.46  0.45
			 3.47  2.15  1.44  0.98  3.45  1.90  4.53  2.13  1.60  0.57  0.37  0.33
			 5.17  3.44  2.57  2.01  5.10  3.11  6.15  3.17  2.59  1.48  1.29  1.19
			19.49 15.69 14.36 13.75 18.91 14.80 19.37 13.08 12.80 12.16 12.68 12.48
			 6.13  3.85  2.70  1.95  6.00  3.43  7.37  3.83  3.05  2.12  1.59  1.12
			 6.24  3.74  2.45  1.59  6.11  3.30  7.05  3.45  2.56  2.70  1.79  0.94
			 7.01  4.19  2.73  1.76  6.85  3.68  7.71  3.86  2.86  3.74  2.46  1.08
			 7.79  4.62  3.00  1.93  7.58  4.07  8.41  4.42  3.30  5.14  3.33  1.37
			 8.56  5.06  3.28  2.10  8.31  4.45  9.15  5.09  3.82  6.75  4.49  1.78
			43.67 34.98 31.85 30.28 40.76 32.61 44.14 34.10 32.62 34.39 33.94 29.05
			16.94 11.81  9.47  8.03 16.06 10.74 17.52 12.42 10.77 14.86 12.13  7.90
			10.72  6.27  4.02  2.55 10.32  5.48 11.35  7.68  5.84 10.40  6.95  2.65
			11.35  6.63  4.25  2.70 10.91  5.78 12.00  8.60  6.57 10.76  7.19  2.71
			11.89  6.93  4.44  2.82 11.40  6.03 12.58  9.46  7.25 10.67  7.12  2.65
			12.37  7.19  4.59  2.91 11.83  6.25 13.08 10.24  7.86 10.11  6.72  2.49
			12.75  7.40  4.72  2.99 12.17  6.41 13.45 10.84  8.35  9.27  6.13  2.33
			13.00  7.54  4.80  3.04 12.40  6.52 13.71 11.33  8.75  8.29  5.46  2.10
			13.15  7.62  4.86  3.08 12.54  6.58 13.88 11.71  9.06  7.29  4.79  1.91
			13.23  7.65  4.87  3.09 12.58  6.59 13.95 11.98  9.31  7.91  5.66  3.01
			13.17  7.62  4.85  3.09 12.52  6.56 13.93 12.17  9.48 16.64 14.29 10.83
			13.13  7.62  4.88  3.14 12.47  6.56 13.82 12.28  9.61 16.73 14.96 11.88
			12.85  7.45  4.77  3.06 12.20  6.42 13.64 12.32  9.68 10.44  8.97  6.88
			12.52  7.28  4.67  3.00 11.89  6.28 13.43 12.35  9.74  5.94  4.72  3.43
			12.20  7.15  4.62  2.98 11.61  6.20 13.25 12.44  9.88  3.34  2.33  1.49
			11.83  7.05  4.62  3.01 11.33  6.19 13.08 12.55 10.04  2.35  1.47  0.92
			11.50  7.04  4.73  3.14 11.10  6.30 12.93 12.68 10.26  1.88  1.10  0.71
			11.22  7.16  4.99  3.41 10.96  6.60 12.78 12.77 10.48  1.59  0.89  0.60
			11.05  7.47  5.48  3.90 10.97  7.12 12.60 12.72 10.63  1.47  0.83  0.63
			11.03  8.04  6.25  4.69 11.16  7.94 12.44 12.60 10.76  1.80  1.18  1.10
			11.18  8.88  7.34  5.81 11.54  9.07 12.33 12.43 10.96  5.71  4.90  4.56
			11.53 10.01  8.78  7.32 12.12 10.49 12.26 12.22 11.18 40.98 39.59 34.40
			27.74 24.88 23.82 22.59 27.78 25.22 29.52 28.96 27.71 73.69 72.84 65.40
			17.05 16.64 16.14 15.11 17.73 17.46 17.05 16.51 16.29 33.61 32.61 29.48
			13.55 14.59 14.59 13.88 14.47 15.63 12.44 11.79 12.28  8.24  7.52  7.16
			14.33 16.16 16.63 16.33 15.20 17.22 12.58 11.76 12.74  3.38  2.83  3.08
			15.01 17.56 18.49 18.68 15.77 18.53 12.72 11.77 13.21  2.47  1.96  2.47
			15.52 18.62 19.95 20.64 16.10 19.43 12.83 11.84 13.65  2.14  1.67  2.27
			18.29 21.47 23.11 24.28 18.54 21.97 15.46 14.61 16.57  4.86  4.43  5.09
			19.55 22.79 24.69 26.26 19.50 23.01 16.75 16.11 18.14 11.45 11.28 11.96
			15.48 19.29 21.41 23.28 15.39 19.41 12.83 12.34 14.55 14.79 14.76 15.32
			14.91 18.66 20.85 22.94 14.64 18.56 12.67 12.53 14.65 12.16 12.73 14.27
			14.15 17.73 19.93 22.14 13.72 17.42 12.45 12.72 14.66  8.97  9.74 11.86
			13.22 16.54 18.67 20.91 12.69 16.09 12.19 12.92 14.61  6.52  7.33  9.28
			12.19 15.21 17.22 19.43 11.57 14.64 11.89 13.12 14.50  8.81  9.72 12.31
			11.12 13.80 15.65 17.74 10.45 13.15 11.60 13.34 14.39 44.12 55.27 68.53
			10.03 12.36 14.04 16.00  9.35 11.68 11.35 13.61 14.40 34.55 42.58 53.02
			 8.95 10.95 12.45 14.42  8.29 10.25 11.12 13.87 14.47 12.09 13.18 14.67
			 7.96  9.65 10.95 12.56  7.32  8.96 10.95 14.07 14.62 12.15 13.16 14.38
			 7.02  8.40  9.51 10.93  6.41  7.74 10.76 14.20 14.72 10.52 12.26 14.71
			 6.20  7.32  8.27  9.52  5.63  6.69 10.42 14.16 14.55  4.43  5.11  6.46
			 5.42  6.31  7.11  8.18  4.90  5.71 10.11 14.13 14.40  1.95  2.07  2.57
			 4.73  5.43  6.09  7.01  4.26  4.87 10.04 14.34 14.58  2.19  2.34  2.75
			 4.15  4.68  5.22  6.00  3.72  4.16 10.02 14.50 14.88  3.19  3.58  4.18
			 3.64  4.02  4.45  5.11  3.25  3.55 10.11 14.46 15.51  2.77  3.01  3.44
			 3.20  3.45  3.80  4.36  2.83  3.02  9.87 14.00 15.47  2.29  2.48  2.81
			 2.81  2.96  3.23  3.69  2.49  2.57  8.65 12.58 13.20  2.00  2.14  2.42
			 2.47  2.55  2.75  3.13  2.19  2.20  7.27 10.99 10.57  1.52  1.54  1.64
			 2.18  2.19  2.33  2.64  1.93  1.87  6.44  9.98  9.18  1.35  1.33  1.36
			 1.93  1.89  1.99  2.24  1.71  1.60  5.83  9.22  8.25  1.47  1.46  1.49
			 1.72  1.64  1.70  1.91  1.52  1.37  5.41  8.62  7.57  1.79  1.94  2.14
			 1.67  1.53  1.55  1.70  1.43  1.29  5.04  8.07  7.03  1.74  2.00  2.34
			 1.43  1.27  1.27  1.39  1.26  1.05  4.57  7.39  6.35  1.02  1.20  1.42
			 1.29  1.10  1.09  1.18  1.13  0.91  4.12  6.71  5.72  1.14  1.35  1.61
			 1.19  0.99  0.96  1.03  1.05  0.81  3.77  6.16  5.25  3.32  4.10  5.04
			 1.08  0.88  0.83  0.88  0.96  0.71  3.46  5.63  4.80  4.49  5.58  6.98
			 0.96  0.76  0.71  0.74  0.85  0.61  3.08  5.03  4.29  2.05  2.51  3.19
			 0.88  0.68  0.62  0.64  0.78  0.54  2.73  4.46  3.80  0.49  0.57  0.71
			 0.81  0.61  0.54  0.54  0.72  0.48  2.47  4.02  3.43  0.24  0.27  0.30
			 0.77  0.56  0.49  0.49  0.68  0.44  2.25  3.66  3.12  0.21  0.23  0.26
			 0.75  0.54  0.46  0.46  0.67  0.43  2.06  3.36  2.86  0.21  0.21  0.23
			 0.73  0.51  0.43  0.42  0.65  0.40  1.90  3.09  2.64  0.24  0.24  0.28
			 0.68  0.47  0.39  0.37  0.61  0.37  1.75  2.85  2.43  0.24  0.24  0.28
			 0.69  0.47  0.39  0.37  0.62  0.38  1.62  2.65  2.26  0.21  0.20  0.21
			 0.64  0.43  0.35  0.33  0.59  0.35  1.54  2.51  2.14  0.17  0.24  0.17
			 0.68  0.46  0.38  0.35  0.62  0.39  1.45  2.37  2.02  0.21  0.32  0.21
			 0.69  0.47  0.39  0.36  0.64  0.41  1.32  2.15  1.83  0.22  0.26  0.19
			 0.61  0.40  0.33  0.31  0.55  0.33  1.17  1.89  1.61  0.17  0.16  0.15
			 0.52  0.33  0.28  0.26  0.47  0.26  0.99  1.61  1.38  0.12  0.12  0.10
			 0.43  0.27  0.21  0.19  0.40  0.21  0.81  1.32  1.12  0.09  0.09  0.05
			];
		Fwl=380:5:780;
		for i=1:12
			Field=['F' int2str(i)];
			Illuminants.(Field).Power = F(:,i);
			Illuminants.(Field).wl=Fwl;
			end
		end
	ill=[];
	charill=upper(charill);
	if isfield(Illuminants,charill)
		ill=interp1(Illuminants.(charill).wl,Illuminants.(charill).Power, wl, 'linear',0);
	elseif strcmp(charill,'E')
		ill=100*ones(1,length(wl));
	elseif ~isempty(regexp(charill,'^[DP]((\d{2})|(\d{4}))$', 'once'))
		if length(charill)==3
			charill=[charill '00'];
			end
		T=str2double(charill(2:end));
		if charill(1)=='P'
			ill=blackbody(T,wl);
		elseif charill(1)=='D'
			ill=dill(T,wl);
			end
		end
