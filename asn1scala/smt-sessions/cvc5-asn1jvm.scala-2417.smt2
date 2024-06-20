; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61624 () Bool)

(assert start!61624)

(declare-fun b!276719 () Bool)

(declare-fun res!229886 () Bool)

(declare-fun e!196638 () Bool)

(assert (=> b!276719 (=> (not res!229886) (not e!196638))))

(declare-datatypes ((array!15838 0))(
  ( (array!15839 (arr!7849 (Array (_ BitVec 32) (_ BitVec 8))) (size!6856 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12526 0))(
  ( (BitStream!12527 (buf!7324 array!15838) (currentByte!13562 (_ BitVec 32)) (currentBit!13557 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12526)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276719 (= res!229886 (validate_offset_bit!0 ((_ sign_extend 32) (size!6856 (buf!7324 bs1!11))) ((_ sign_extend 32) (currentByte!13562 bs1!11)) ((_ sign_extend 32) (currentBit!13557 bs1!11))))))

(declare-fun b!276720 () Bool)

(declare-fun res!229888 () Bool)

(assert (=> b!276720 (=> (not res!229888) (not e!196638))))

(declare-fun bs2!19 () BitStream!12526)

(declare-fun arrayBitRangesEq!0 (array!15838 array!15838 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276720 (= res!229888 (arrayBitRangesEq!0 (buf!7324 bs1!11) (buf!7324 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6856 (buf!7324 bs1!11)) (currentByte!13562 bs1!11) (currentBit!13557 bs1!11)))))))

(declare-fun b!276721 () Bool)

(assert (=> b!276721 (= e!196638 (not true))))

(declare-datatypes ((tuple2!22566 0))(
  ( (tuple2!22567 (_1!12333 BitStream!12526) (_2!12333 Bool)) )
))
(declare-fun lt!414870 () tuple2!22566)

(declare-fun readBitPure!0 (BitStream!12526) tuple2!22566)

(assert (=> b!276721 (= lt!414870 (readBitPure!0 (BitStream!12527 (buf!7324 bs2!19) (currentByte!13562 bs1!11) (currentBit!13557 bs1!11))))))

(declare-fun lt!414869 () tuple2!22566)

(assert (=> b!276721 (= lt!414869 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276721 (invariant!0 (currentBit!13557 bs1!11) (currentByte!13562 bs1!11) (size!6856 (buf!7324 bs2!19)))))

(declare-fun res!229887 () Bool)

(assert (=> start!61624 (=> (not res!229887) (not e!196638))))

(assert (=> start!61624 (= res!229887 (= (size!6856 (buf!7324 bs1!11)) (size!6856 (buf!7324 bs2!19))))))

(assert (=> start!61624 e!196638))

(declare-fun e!196636 () Bool)

(declare-fun inv!12 (BitStream!12526) Bool)

(assert (=> start!61624 (and (inv!12 bs1!11) e!196636)))

(declare-fun e!196640 () Bool)

(assert (=> start!61624 (and (inv!12 bs2!19) e!196640)))

(declare-fun b!276722 () Bool)

(declare-fun array_inv!6580 (array!15838) Bool)

(assert (=> b!276722 (= e!196640 (array_inv!6580 (buf!7324 bs2!19)))))

(declare-fun b!276723 () Bool)

(assert (=> b!276723 (= e!196636 (array_inv!6580 (buf!7324 bs1!11)))))

(assert (= (and start!61624 res!229887) b!276719))

(assert (= (and b!276719 res!229886) b!276720))

(assert (= (and b!276720 res!229888) b!276721))

(assert (= start!61624 b!276723))

(assert (= start!61624 b!276722))

(declare-fun m!409763 () Bool)

(assert (=> b!276721 m!409763))

(declare-fun m!409765 () Bool)

(assert (=> b!276721 m!409765))

(declare-fun m!409767 () Bool)

(assert (=> b!276721 m!409767))

(declare-fun m!409769 () Bool)

(assert (=> b!276719 m!409769))

(declare-fun m!409771 () Bool)

(assert (=> b!276723 m!409771))

(declare-fun m!409773 () Bool)

(assert (=> b!276722 m!409773))

(declare-fun m!409775 () Bool)

(assert (=> b!276720 m!409775))

(declare-fun m!409777 () Bool)

(assert (=> b!276720 m!409777))

(declare-fun m!409779 () Bool)

(assert (=> start!61624 m!409779))

(declare-fun m!409781 () Bool)

(assert (=> start!61624 m!409781))

(push 1)

(assert (not b!276719))

(assert (not b!276720))

(assert (not b!276721))

(assert (not b!276723))

(assert (not b!276722))

(assert (not start!61624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

