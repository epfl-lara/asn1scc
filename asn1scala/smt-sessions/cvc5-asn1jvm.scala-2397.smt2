; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61112 () Bool)

(assert start!61112)

(declare-fun b!275200 () Bool)

(declare-fun e!195165 () Bool)

(assert (=> b!275200 (= e!195165 false)))

(declare-fun lt!413468 () (_ BitVec 64))

(declare-datatypes ((array!15694 0))(
  ( (array!15695 (arr!7783 (Array (_ BitVec 32) (_ BitVec 8))) (size!6796 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12406 0))(
  ( (BitStream!12407 (buf!7264 array!15694) (currentByte!13431 (_ BitVec 32)) (currentBit!13426 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12406)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275200 (= lt!413468 (bitIndex!0 (size!6796 (buf!7264 bs1!11)) (currentByte!13431 bs1!11) (currentBit!13426 bs1!11)))))

(declare-fun res!228834 () Bool)

(assert (=> start!61112 (=> (not res!228834) (not e!195165))))

(declare-fun bs2!19 () BitStream!12406)

(assert (=> start!61112 (= res!228834 (= (size!6796 (buf!7264 bs1!11)) (size!6796 (buf!7264 bs2!19))))))

(assert (=> start!61112 e!195165))

(declare-fun e!195166 () Bool)

(declare-fun inv!12 (BitStream!12406) Bool)

(assert (=> start!61112 (and (inv!12 bs1!11) e!195166)))

(declare-fun e!195163 () Bool)

(assert (=> start!61112 (and (inv!12 bs2!19) e!195163)))

(declare-fun b!275199 () Bool)

(declare-fun res!228835 () Bool)

(assert (=> b!275199 (=> (not res!228835) (not e!195165))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275199 (= res!228835 (validate_offset_bit!0 ((_ sign_extend 32) (size!6796 (buf!7264 bs1!11))) ((_ sign_extend 32) (currentByte!13431 bs1!11)) ((_ sign_extend 32) (currentBit!13426 bs1!11))))))

(declare-fun b!275202 () Bool)

(declare-fun array_inv!6520 (array!15694) Bool)

(assert (=> b!275202 (= e!195163 (array_inv!6520 (buf!7264 bs2!19)))))

(declare-fun b!275201 () Bool)

(assert (=> b!275201 (= e!195166 (array_inv!6520 (buf!7264 bs1!11)))))

(assert (= (and start!61112 res!228834) b!275199))

(assert (= (and b!275199 res!228835) b!275200))

(assert (= start!61112 b!275201))

(assert (= start!61112 b!275202))

(declare-fun m!407785 () Bool)

(assert (=> b!275200 m!407785))

(declare-fun m!407787 () Bool)

(assert (=> start!61112 m!407787))

(declare-fun m!407789 () Bool)

(assert (=> start!61112 m!407789))

(declare-fun m!407791 () Bool)

(assert (=> b!275199 m!407791))

(declare-fun m!407793 () Bool)

(assert (=> b!275202 m!407793))

(declare-fun m!407795 () Bool)

(assert (=> b!275201 m!407795))

(push 1)

(assert (not start!61112))

(assert (not b!275202))

(assert (not b!275201))

(assert (not b!275199))

(assert (not b!275200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

