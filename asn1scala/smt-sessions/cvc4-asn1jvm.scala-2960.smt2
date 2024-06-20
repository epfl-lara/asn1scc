; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69962 () Bool)

(assert start!69962)

(declare-fun b!316202 () Bool)

(declare-fun res!259310 () Bool)

(declare-fun e!227244 () Bool)

(assert (=> b!316202 (=> (not res!259310) (not e!227244))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!316202 (= res!259310 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316203 () Bool)

(declare-fun res!259313 () Bool)

(assert (=> b!316203 (=> (not res!259313) (not e!227244))))

(declare-datatypes ((array!19493 0))(
  ( (array!19494 (arr!9552 (Array (_ BitVec 32) (_ BitVec 8))) (size!8469 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19493)

(declare-fun a3!79 () array!19493)

(declare-fun arrayBitRangesEq!0 (array!19493 array!19493 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316203 (= res!259313 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316204 () Bool)

(declare-fun res!259311 () Bool)

(assert (=> b!316204 (=> (not res!259311) (not e!227244))))

(declare-fun a2!825 () array!19493)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316204 (= res!259311 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316205 () Bool)

(declare-fun res!259307 () Bool)

(assert (=> b!316205 (=> (not res!259307) (not e!227244))))

(assert (=> b!316205 (= res!259307 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316206 () Bool)

(assert (=> b!316206 (= e!227244 (not (and (bvsle from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82))))))

(assert (=> b!316206 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21693 0))(
  ( (Unit!21694) )
))
(declare-fun lt!442853 () Unit!21693)

(declare-fun arrayBitRangesEqDrop1!0 (array!19493 array!19493 (_ BitVec 64) (_ BitVec 64)) Unit!21693)

(assert (=> b!316206 (= lt!442853 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316206 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442852 () Unit!21693)

(assert (=> b!316206 (= lt!442852 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316206 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442851 () Unit!21693)

(declare-fun arrayBitRangesEqAppend!0 (array!19493 array!19493 (_ BitVec 64) (_ BitVec 64)) Unit!21693)

(assert (=> b!316206 (= lt!442851 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316208 () Bool)

(declare-fun res!259309 () Bool)

(assert (=> b!316208 (=> (not res!259309) (not e!227244))))

(assert (=> b!316208 (= res!259309 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316209 () Bool)

(declare-fun res!259312 () Bool)

(assert (=> b!316209 (=> (not res!259312) (not e!227244))))

(assert (=> b!316209 (= res!259312 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316207 () Bool)

(declare-fun res!259306 () Bool)

(assert (=> b!316207 (=> (not res!259306) (not e!227244))))

(assert (=> b!316207 (= res!259306 (not (= i!1020 mid!82)))))

(declare-fun res!259308 () Bool)

(assert (=> start!69962 (=> (not res!259308) (not e!227244))))

(assert (=> start!69962 (= res!259308 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8469 a1!825) (size!8469 a2!825)) (= (size!8469 a2!825) (size!8469 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8469 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8469 a2!825))))))))

(assert (=> start!69962 e!227244))

(assert (=> start!69962 true))

(declare-fun array_inv!8021 (array!19493) Bool)

(assert (=> start!69962 (array_inv!8021 a1!825)))

(assert (=> start!69962 (array_inv!8021 a3!79)))

(assert (=> start!69962 (array_inv!8021 a2!825)))

(assert (= (and start!69962 res!259308) b!316208))

(assert (= (and b!316208 res!259309) b!316209))

(assert (= (and b!316209 res!259312) b!316202))

(assert (= (and b!316202 res!259310) b!316205))

(assert (= (and b!316205 res!259307) b!316204))

(assert (= (and b!316204 res!259311) b!316203))

(assert (= (and b!316203 res!259313) b!316207))

(assert (= (and b!316207 res!259306) b!316206))

(declare-fun m!453967 () Bool)

(assert (=> b!316206 m!453967))

(declare-fun m!453969 () Bool)

(assert (=> b!316206 m!453969))

(declare-fun m!453971 () Bool)

(assert (=> b!316206 m!453971))

(declare-fun m!453973 () Bool)

(assert (=> b!316206 m!453973))

(declare-fun m!453975 () Bool)

(assert (=> b!316206 m!453975))

(declare-fun m!453977 () Bool)

(assert (=> b!316206 m!453977))

(declare-fun m!453979 () Bool)

(assert (=> b!316205 m!453979))

(declare-fun m!453981 () Bool)

(assert (=> b!316208 m!453981))

(declare-fun m!453983 () Bool)

(assert (=> b!316204 m!453983))

(declare-fun m!453985 () Bool)

(assert (=> b!316209 m!453985))

(declare-fun m!453987 () Bool)

(assert (=> start!69962 m!453987))

(declare-fun m!453989 () Bool)

(assert (=> start!69962 m!453989))

(declare-fun m!453991 () Bool)

(assert (=> start!69962 m!453991))

(declare-fun m!453993 () Bool)

(assert (=> b!316203 m!453993))

(push 1)

(assert (not start!69962))

(assert (not b!316203))

(assert (not b!316208))

(assert (not b!316205))

(assert (not b!316209))

(assert (not b!316206))

(assert (not b!316204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

