; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69942 () Bool)

(assert start!69942)

(declare-fun b!315962 () Bool)

(declare-fun res!259066 () Bool)

(declare-fun e!227122 () Bool)

(assert (=> b!315962 (=> (not res!259066) (not e!227122))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19473 0))(
  ( (array!19474 (arr!9542 (Array (_ BitVec 32) (_ BitVec 8))) (size!8459 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19473)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19473)

(declare-fun arrayBitRangesEq!0 (array!19473 array!19473 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315962 (= res!259066 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!259069 () Bool)

(assert (=> start!69942 (=> (not res!259069) (not e!227122))))

(declare-fun a3!79 () array!19473)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> start!69942 (= res!259069 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8459 a1!825) (size!8459 a2!825)) (= (size!8459 a2!825) (size!8459 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8459 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8459 a2!825))))))))

(assert (=> start!69942 e!227122))

(assert (=> start!69942 true))

(declare-fun array_inv!8011 (array!19473) Bool)

(assert (=> start!69942 (array_inv!8011 a1!825)))

(assert (=> start!69942 (array_inv!8011 a3!79)))

(assert (=> start!69942 (array_inv!8011 a2!825)))

(declare-fun b!315963 () Bool)

(declare-fun res!259073 () Bool)

(assert (=> b!315963 (=> (not res!259073) (not e!227122))))

(assert (=> b!315963 (= res!259073 (not (= i!1020 mid!82)))))

(declare-fun b!315964 () Bool)

(declare-fun res!259070 () Bool)

(assert (=> b!315964 (=> (not res!259070) (not e!227122))))

(assert (=> b!315964 (= res!259070 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315965 () Bool)

(declare-fun res!259072 () Bool)

(assert (=> b!315965 (=> (not res!259072) (not e!227122))))

(assert (=> b!315965 (= res!259072 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315966 () Bool)

(declare-fun res!259068 () Bool)

(assert (=> b!315966 (=> (not res!259068) (not e!227122))))

(assert (=> b!315966 (= res!259068 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315967 () Bool)

(assert (=> b!315967 (= e!227122 (not true))))

(assert (=> b!315967 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21673 0))(
  ( (Unit!21674) )
))
(declare-fun lt!442774 () Unit!21673)

(declare-fun arrayBitRangesEqDrop1!0 (array!19473 array!19473 (_ BitVec 64) (_ BitVec 64)) Unit!21673)

(assert (=> b!315967 (= lt!442774 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!315967 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442775 () Unit!21673)

(declare-fun arrayBitRangesEqAppend!0 (array!19473 array!19473 (_ BitVec 64) (_ BitVec 64)) Unit!21673)

(assert (=> b!315967 (= lt!442775 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315968 () Bool)

(declare-fun res!259071 () Bool)

(assert (=> b!315968 (=> (not res!259071) (not e!227122))))

(assert (=> b!315968 (= res!259071 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315969 () Bool)

(declare-fun res!259067 () Bool)

(assert (=> b!315969 (=> (not res!259067) (not e!227122))))

(assert (=> b!315969 (= res!259067 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69942 res!259069) b!315968))

(assert (= (and b!315968 res!259071) b!315966))

(assert (= (and b!315966 res!259068) b!315965))

(assert (= (and b!315965 res!259072) b!315962))

(assert (= (and b!315962 res!259066) b!315964))

(assert (= (and b!315964 res!259070) b!315969))

(assert (= (and b!315969 res!259067) b!315963))

(assert (= (and b!315963 res!259073) b!315967))

(declare-fun m!453707 () Bool)

(assert (=> b!315962 m!453707))

(declare-fun m!453709 () Bool)

(assert (=> b!315966 m!453709))

(declare-fun m!453711 () Bool)

(assert (=> b!315964 m!453711))

(declare-fun m!453713 () Bool)

(assert (=> b!315969 m!453713))

(declare-fun m!453715 () Bool)

(assert (=> b!315967 m!453715))

(declare-fun m!453717 () Bool)

(assert (=> b!315967 m!453717))

(declare-fun m!453719 () Bool)

(assert (=> b!315967 m!453719))

(declare-fun m!453721 () Bool)

(assert (=> b!315967 m!453721))

(declare-fun m!453723 () Bool)

(assert (=> b!315968 m!453723))

(declare-fun m!453725 () Bool)

(assert (=> start!69942 m!453725))

(declare-fun m!453727 () Bool)

(assert (=> start!69942 m!453727))

(declare-fun m!453729 () Bool)

(assert (=> start!69942 m!453729))

(check-sat (not b!315968) (not b!315966) (not b!315964) (not b!315969) (not start!69942) (not b!315967) (not b!315962))
