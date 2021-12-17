<?php declare(strict_types = 1);

class HelloWorld
{
	public function sayHello(DateTimeImutable $date): void
	{
		echo 'Hello, ' . $date->format('j. n. Y');
		$date->TEST();
		$date->AAAA();
		$date->BBBB();
		$date->AAAAA();
	}
}
