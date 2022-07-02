<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<% int a = Integer.parseInt(request.getParameter("inp1"));
		int b = Integer.parseInt(request.getParameter("sel"));
		int d,sum=0,n,temp;
		int  c=0;
		int fact=1;
		switch(b)
		{
			case 0:
				int x;
				for(x=a;x>=1;x--)
				{
					fact = fact*x;
				}
				out.println("<br>The factorial is of "+a+" is "+fact);
				break;

			case 1:
				n=a;
				while(n!=0)
				{
					d=n%10;
					sum =sum*10+d;
					n=n/10;
				}
					out.println("The entered number is"+" "+a);
				if(sum==a)
				{
					out.println("<br>The number "+a+" is a palindrome.");
				}
				else
				{
					out.println("<br>The number "+a+" is not a palindrome.");
				}
				break;

			case 2:
				temp = a;
				while(temp>0)
				{
					temp=temp/10;
					c=c+1;
				}
				n = a;
				while(n!=0)
				{
					d=n%10;
					sum = sum + ((int)Math.pow(d,c));
					n=n/10;
				}
				if(sum!=a)
				{
					out.println("<br>The number is not armstrong.");
				}
				else
				{
					out.println("<br>The number "+" "+a+" is armstrong.");
				}
				break;

				case 3:
					int j=0,k=1,l,y;
					if(a<=0)
					{
						out.println("Wrong Input.");
					}
					else if(a==1)
					{
						out.println(j);
					}
					else if(a==2)
					{
						out.print(j+" "+k);
					}
					else
					{
						out.print(j+" "+k);
						for(y=2;y<a;++y)
 						{
  							l=j+k;
  							out.print(" "+l);
  							j=k;
 							k=l;
 						}
					}
					break;

			default:
				out.println("Wrong Input.");
		}
	%>



</body>
</html>
