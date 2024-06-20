; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61626 () Bool)

(assert start!61626)

(declare-fun b!276734 () Bool)

(declare-fun e!196652 () Bool)

(assert (=> b!276734 (= e!196652 (not true))))

(declare-datatypes ((array!15840 0))(
  ( (array!15841 (arr!7850 (Array (_ BitVec 32) (_ BitVec 8))) (size!6857 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12528 0))(
  ( (BitStream!12529 (buf!7325 array!15840) (currentByte!13563 (_ BitVec 32)) (currentBit!13558 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22568 0))(
  ( (tuple2!22569 (_1!12334 BitStream!12528) (_2!12334 Bool)) )
))
(declare-fun lt!414875 () tuple2!22568)

(declare-fun bs2!19 () BitStream!12528)

(declare-fun bs1!11 () BitStream!12528)

(declare-fun readBitPure!0 (BitStream!12528) tuple2!22568)

(assert (=> b!276734 (= lt!414875 (readBitPure!0 (BitStream!12529 (buf!7325 bs2!19) (currentByte!13563 bs1!11) (currentBit!13558 bs1!11))))))

(declare-fun lt!414876 () tuple2!22568)

(assert (=> b!276734 (= lt!414876 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276734 (invariant!0 (currentBit!13558 bs1!11) (currentByte!13563 bs1!11) (size!6857 (buf!7325 bs2!19)))))

(declare-fun b!276735 () Bool)

(declare-fun res!229895 () Bool)

(assert (=> b!276735 (=> (not res!229895) (not e!196652))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276735 (= res!229895 (validate_offset_bit!0 ((_ sign_extend 32) (size!6857 (buf!7325 bs1!11))) ((_ sign_extend 32) (currentByte!13563 bs1!11)) ((_ sign_extend 32) (currentBit!13558 bs1!11))))))

(declare-fun b!276736 () Bool)

(declare-fun res!229896 () Bool)

(assert (=> b!276736 (=> (not res!229896) (not e!196652))))

(declare-fun arrayBitRangesEq!0 (array!15840 array!15840 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276736 (= res!229896 (arrayBitRangesEq!0 (buf!7325 bs1!11) (buf!7325 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6857 (buf!7325 bs1!11)) (currentByte!13563 bs1!11) (currentBit!13558 bs1!11)))))))

(declare-fun b!276737 () Bool)

(declare-fun e!196653 () Bool)

(declare-fun array_inv!6581 (array!15840) Bool)

(assert (=> b!276737 (= e!196653 (array_inv!6581 (buf!7325 bs2!19)))))

(declare-fun b!276738 () Bool)

(declare-fun e!196654 () Bool)

(assert (=> b!276738 (= e!196654 (array_inv!6581 (buf!7325 bs1!11)))))

(declare-fun res!229897 () Bool)

(assert (=> start!61626 (=> (not res!229897) (not e!196652))))

(assert (=> start!61626 (= res!229897 (= (size!6857 (buf!7325 bs1!11)) (size!6857 (buf!7325 bs2!19))))))

(assert (=> start!61626 e!196652))

(declare-fun inv!12 (BitStream!12528) Bool)

(assert (=> start!61626 (and (inv!12 bs1!11) e!196654)))

(assert (=> start!61626 (and (inv!12 bs2!19) e!196653)))

(assert (= (and start!61626 res!229897) b!276735))

(assert (= (and b!276735 res!229895) b!276736))

(assert (= (and b!276736 res!229896) b!276734))

(assert (= start!61626 b!276738))

(assert (= start!61626 b!276737))

(declare-fun m!409783 () Bool)

(assert (=> start!61626 m!409783))

(declare-fun m!409785 () Bool)

(assert (=> start!61626 m!409785))

(declare-fun m!409787 () Bool)

(assert (=> b!276738 m!409787))

(declare-fun m!409789 () Bool)

(assert (=> b!276736 m!409789))

(declare-fun m!409791 () Bool)

(assert (=> b!276736 m!409791))

(declare-fun m!409793 () Bool)

(assert (=> b!276734 m!409793))

(declare-fun m!409795 () Bool)

(assert (=> b!276734 m!409795))

(declare-fun m!409797 () Bool)

(assert (=> b!276734 m!409797))

(declare-fun m!409799 () Bool)

(assert (=> b!276737 m!409799))

(declare-fun m!409801 () Bool)

(assert (=> b!276735 m!409801))

(check-sat (not b!276736) (not b!276734) (not start!61626) (not b!276737) (not b!276735) (not b!276738))
