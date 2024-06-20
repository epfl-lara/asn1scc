; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69930 () Bool)

(assert start!69930)

(declare-fun b!315818 () Bool)

(declare-fun res!258926 () Bool)

(declare-fun e!227050 () Bool)

(assert (=> b!315818 (=> (not res!258926) (not e!227050))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315818 (= res!258926 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315819 () Bool)

(declare-fun res!258928 () Bool)

(assert (=> b!315819 (=> (not res!258928) (not e!227050))))

(declare-datatypes ((array!19461 0))(
  ( (array!19462 (arr!9536 (Array (_ BitVec 32) (_ BitVec 8))) (size!8453 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19461)

(declare-fun a2!825 () array!19461)

(declare-fun arrayBitRangesEq!0 (array!19461 array!19461 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315819 (= res!258928 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315820 () Bool)

(declare-fun res!258927 () Bool)

(assert (=> b!315820 (=> (not res!258927) (not e!227050))))

(assert (=> b!315820 (= res!258927 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315821 () Bool)

(declare-fun res!258923 () Bool)

(assert (=> b!315821 (=> (not res!258923) (not e!227050))))

(assert (=> b!315821 (= res!258923 (not (= i!1020 mid!82)))))

(declare-fun res!258922 () Bool)

(assert (=> start!69930 (=> (not res!258922) (not e!227050))))

(declare-fun a3!79 () array!19461)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69930 (= res!258922 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8453 a1!825) (size!8453 a2!825)) (= (size!8453 a2!825) (size!8453 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8453 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8453 a2!825))))))))

(assert (=> start!69930 e!227050))

(assert (=> start!69930 true))

(declare-fun array_inv!8005 (array!19461) Bool)

(assert (=> start!69930 (array_inv!8005 a1!825)))

(assert (=> start!69930 (array_inv!8005 a3!79)))

(assert (=> start!69930 (array_inv!8005 a2!825)))

(declare-fun b!315822 () Bool)

(assert (=> b!315822 (= e!227050 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1020) (bvslt i!1020 to!845))))))

(assert (=> b!315822 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21661 0))(
  ( (Unit!21662) )
))
(declare-fun lt!442739 () Unit!21661)

(declare-fun arrayBitRangesEqDrop1!0 (array!19461 array!19461 (_ BitVec 64) (_ BitVec 64)) Unit!21661)

(assert (=> b!315822 (= lt!442739 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!315822 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442738 () Unit!21661)

(declare-fun arrayBitRangesEqAppend!0 (array!19461 array!19461 (_ BitVec 64) (_ BitVec 64)) Unit!21661)

(assert (=> b!315822 (= lt!442738 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315823 () Bool)

(declare-fun res!258929 () Bool)

(assert (=> b!315823 (=> (not res!258929) (not e!227050))))

(assert (=> b!315823 (= res!258929 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315824 () Bool)

(declare-fun res!258925 () Bool)

(assert (=> b!315824 (=> (not res!258925) (not e!227050))))

(assert (=> b!315824 (= res!258925 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315825 () Bool)

(declare-fun res!258924 () Bool)

(assert (=> b!315825 (=> (not res!258924) (not e!227050))))

(assert (=> b!315825 (= res!258924 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69930 res!258922) b!315820))

(assert (= (and b!315820 res!258927) b!315825))

(assert (= (and b!315825 res!258924) b!315818))

(assert (= (and b!315818 res!258926) b!315819))

(assert (= (and b!315819 res!258928) b!315823))

(assert (= (and b!315823 res!258929) b!315824))

(assert (= (and b!315824 res!258925) b!315821))

(assert (= (and b!315821 res!258923) b!315822))

(declare-fun m!453563 () Bool)

(assert (=> b!315824 m!453563))

(declare-fun m!453565 () Bool)

(assert (=> b!315822 m!453565))

(declare-fun m!453567 () Bool)

(assert (=> b!315822 m!453567))

(declare-fun m!453569 () Bool)

(assert (=> b!315822 m!453569))

(declare-fun m!453571 () Bool)

(assert (=> b!315822 m!453571))

(declare-fun m!453573 () Bool)

(assert (=> b!315819 m!453573))

(declare-fun m!453575 () Bool)

(assert (=> b!315823 m!453575))

(declare-fun m!453577 () Bool)

(assert (=> start!69930 m!453577))

(declare-fun m!453579 () Bool)

(assert (=> start!69930 m!453579))

(declare-fun m!453581 () Bool)

(assert (=> start!69930 m!453581))

(declare-fun m!453583 () Bool)

(assert (=> b!315820 m!453583))

(declare-fun m!453585 () Bool)

(assert (=> b!315825 m!453585))

(check-sat (not b!315823) (not b!315824) (not b!315822) (not b!315825) (not b!315819) (not b!315820) (not start!69930))
(check-sat)
