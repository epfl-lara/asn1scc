; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70356 () Bool)

(assert start!70356)

(declare-fun res!261792 () Bool)

(declare-fun e!228961 () Bool)

(assert (=> start!70356 (=> (not res!261792) (not e!228961))))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19821 0))(
  ( (array!19822 (arr!9719 (Array (_ BitVec 32) (_ BitVec 8))) (size!8630 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19821)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19821)

(assert (=> start!70356 (= res!261792 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8630 a1!898) (size!8630 a2!898))))))

(assert (=> start!70356 e!228961))

(assert (=> start!70356 true))

(declare-fun array_inv!8182 (array!19821) Bool)

(assert (=> start!70356 (array_inv!8182 a1!898)))

(assert (=> start!70356 (array_inv!8182 a2!898)))

(declare-fun b!318735 () Bool)

(declare-fun e!228960 () Bool)

(assert (=> b!318735 (= e!228961 e!228960)))

(declare-fun res!261793 () Bool)

(assert (=> b!318735 (=> (not res!261793) (not e!228960))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun lt!443440 () (_ BitVec 64))

(assert (=> b!318735 (= res!261793 (and (bvsle to!864 lt!443440) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> b!318735 (= lt!443440 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8630 a1!898))))))

(declare-fun b!318736 () Bool)

(declare-fun res!261791 () Bool)

(assert (=> b!318736 (=> (not res!261791) (not e!228960))))

(declare-fun arrayBitRangesEq!0 (array!19821 array!19821 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318736 (= res!261791 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318737 () Bool)

(assert (=> b!318737 (= e!228960 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!296) (bvslt at!296 lt!443440))))))

(declare-fun bitAt!0 (array!19821 (_ BitVec 64)) Bool)

(assert (=> b!318737 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21877 0))(
  ( (Unit!21878) )
))
(declare-fun lt!443441 () Unit!21877)

(declare-fun rec!22 (array!19821 array!19821 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21877)

(assert (=> b!318737 (= lt!443441 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70356 res!261792) b!318735))

(assert (= (and b!318735 res!261793) b!318736))

(assert (= (and b!318736 res!261791) b!318737))

(declare-fun m!456947 () Bool)

(assert (=> start!70356 m!456947))

(declare-fun m!456949 () Bool)

(assert (=> start!70356 m!456949))

(declare-fun m!456951 () Bool)

(assert (=> b!318736 m!456951))

(declare-fun m!456953 () Bool)

(assert (=> b!318737 m!456953))

(declare-fun m!456955 () Bool)

(assert (=> b!318737 m!456955))

(declare-fun m!456957 () Bool)

(assert (=> b!318737 m!456957))

(check-sat (not start!70356) (not b!318737) (not b!318736))
(check-sat)
