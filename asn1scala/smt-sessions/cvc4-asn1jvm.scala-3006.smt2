; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70274 () Bool)

(assert start!70274)

(declare-fun res!261548 () Bool)

(declare-fun e!228653 () Bool)

(assert (=> start!70274 (=> (not res!261548) (not e!228653))))

(declare-datatypes ((array!19772 0))(
  ( (array!19773 (arr!9693 (Array (_ BitVec 32) (_ BitVec 8))) (size!8607 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19772)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19772)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70274 (= res!261548 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8607 a1!721) (size!8607 a2!721))))))

(assert (=> start!70274 e!228653))

(assert (=> start!70274 true))

(declare-fun array_inv!8159 (array!19772) Bool)

(assert (=> start!70274 (array_inv!8159 a1!721)))

(assert (=> start!70274 (array_inv!8159 a2!721)))

(declare-fun b!318466 () Bool)

(declare-fun e!228652 () Bool)

(assert (=> b!318466 (= e!228653 e!228652)))

(declare-fun res!261546 () Bool)

(assert (=> b!318466 (=> (not res!261546) (not e!228652))))

(declare-fun lt!443393 () (_ BitVec 64))

(assert (=> b!318466 (= res!261546 (bvsle to!813 lt!443393))))

(assert (=> b!318466 (= lt!443393 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8607 a1!721))))))

(declare-fun b!318467 () Bool)

(declare-fun res!261547 () Bool)

(assert (=> b!318467 (=> (not res!261547) (not e!228652))))

(declare-fun arrayBitRangesEq!0 (array!19772 array!19772 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318467 (= res!261547 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318468 () Bool)

(assert (=> b!318468 (= e!228652 (bvsge (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) lt!443393))))

(assert (= (and start!70274 res!261548) b!318466))

(assert (= (and b!318466 res!261546) b!318467))

(assert (= (and b!318467 res!261547) b!318468))

(declare-fun m!456551 () Bool)

(assert (=> start!70274 m!456551))

(declare-fun m!456553 () Bool)

(assert (=> start!70274 m!456553))

(declare-fun m!456555 () Bool)

(assert (=> b!318467 m!456555))

(push 1)

(assert (not start!70274))

(assert (not b!318467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

