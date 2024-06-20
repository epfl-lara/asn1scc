; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61088 () Bool)

(assert start!61088)

(declare-fun b!275187 () Bool)

(declare-fun res!228828 () Bool)

(declare-fun e!195149 () Bool)

(assert (=> b!275187 (=> (not res!228828) (not e!195149))))

(declare-datatypes ((array!15689 0))(
  ( (array!15690 (arr!7782 (Array (_ BitVec 32) (_ BitVec 8))) (size!6795 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12404 0))(
  ( (BitStream!12405 (buf!7263 array!15689) (currentByte!13425 (_ BitVec 32)) (currentBit!13420 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12404)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275187 (= res!228828 (validate_offset_bit!0 ((_ sign_extend 32) (size!6795 (buf!7263 bs1!11))) ((_ sign_extend 32) (currentByte!13425 bs1!11)) ((_ sign_extend 32) (currentBit!13420 bs1!11))))))

(declare-fun res!228829 () Bool)

(assert (=> start!61088 (=> (not res!228829) (not e!195149))))

(declare-fun bs2!19 () BitStream!12404)

(assert (=> start!61088 (= res!228829 (= (size!6795 (buf!7263 bs1!11)) (size!6795 (buf!7263 bs2!19))))))

(assert (=> start!61088 e!195149))

(declare-fun e!195150 () Bool)

(declare-fun inv!12 (BitStream!12404) Bool)

(assert (=> start!61088 (and (inv!12 bs1!11) e!195150)))

(declare-fun e!195151 () Bool)

(assert (=> start!61088 (and (inv!12 bs2!19) e!195151)))

(declare-fun b!275189 () Bool)

(declare-fun array_inv!6519 (array!15689) Bool)

(assert (=> b!275189 (= e!195150 (array_inv!6519 (buf!7263 bs1!11)))))

(declare-fun b!275188 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275188 (= e!195149 (not (invariant!0 (currentBit!13420 bs1!11) (currentByte!13425 bs1!11) (size!6795 (buf!7263 bs1!11)))))))

(declare-fun b!275190 () Bool)

(assert (=> b!275190 (= e!195151 (array_inv!6519 (buf!7263 bs2!19)))))

(assert (= (and start!61088 res!228829) b!275187))

(assert (= (and b!275187 res!228828) b!275188))

(assert (= start!61088 b!275189))

(assert (= start!61088 b!275190))

(declare-fun m!407763 () Bool)

(assert (=> b!275190 m!407763))

(declare-fun m!407765 () Bool)

(assert (=> b!275189 m!407765))

(declare-fun m!407767 () Bool)

(assert (=> start!61088 m!407767))

(declare-fun m!407769 () Bool)

(assert (=> start!61088 m!407769))

(declare-fun m!407771 () Bool)

(assert (=> b!275188 m!407771))

(declare-fun m!407773 () Bool)

(assert (=> b!275187 m!407773))

(push 1)

(assert (not b!275189))

(assert (not b!275190))

(assert (not b!275187))

(assert (not b!275188))

(assert (not start!61088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

