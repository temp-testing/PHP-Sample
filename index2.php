<?php declare(strict_types = 1);

class HelloWorld
{
	public function sayHello(DateTimeImutable $date): void
	{
		echo 'Hello, ' . $date->format('j. n. Y');
		$date->asdsa();
		$date->AAAAAA();
		$date->WRONG();
		$date->TEST();
	}
}
