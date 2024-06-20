; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61168 () Bool)

(assert start!61168)

(declare-fun b!275441 () Bool)

(declare-fun res!228981 () Bool)

(declare-fun e!195412 () Bool)

(assert (=> b!275441 (=> (not res!228981) (not e!195412))))

(declare-datatypes ((array!15729 0))(
  ( (array!15730 (arr!7799 (Array (_ BitVec 32) (_ BitVec 8))) (size!6812 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12438 0))(
  ( (BitStream!12439 (buf!7280 array!15729) (currentByte!13453 (_ BitVec 32)) (currentBit!13448 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12438)

(declare-fun bs2!19 () BitStream!12438)

(declare-fun arrayBitRangesEq!0 (array!15729 array!15729 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275441 (= res!228981 (arrayBitRangesEq!0 (buf!7280 bs1!11) (buf!7280 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6812 (buf!7280 bs1!11)) (currentByte!13453 bs1!11) (currentBit!13448 bs1!11)))))))

(declare-fun res!228980 () Bool)

(assert (=> start!61168 (=> (not res!228980) (not e!195412))))

(assert (=> start!61168 (= res!228980 (= (size!6812 (buf!7280 bs1!11)) (size!6812 (buf!7280 bs2!19))))))

(assert (=> start!61168 e!195412))

(declare-fun e!195414 () Bool)

(declare-fun inv!12 (BitStream!12438) Bool)

(assert (=> start!61168 (and (inv!12 bs1!11) e!195414)))

(declare-fun e!195415 () Bool)

(assert (=> start!61168 (and (inv!12 bs2!19) e!195415)))

(declare-fun b!275442 () Bool)

(declare-fun array_inv!6536 (array!15729) Bool)

(assert (=> b!275442 (= e!195415 (array_inv!6536 (buf!7280 bs2!19)))))

(declare-fun b!275443 () Bool)

(assert (=> b!275443 (= e!195414 (array_inv!6536 (buf!7280 bs1!11)))))

(declare-fun b!275444 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275444 (= e!195412 (not (invariant!0 (currentBit!13448 bs1!11) (currentByte!13453 bs1!11) (size!6812 (buf!7280 bs1!11)))))))

(declare-datatypes ((tuple2!22444 0))(
  ( (tuple2!22445 (_1!12254 BitStream!12438) (_2!12254 Bool)) )
))
(declare-fun lt!413576 () tuple2!22444)

(declare-fun readBitPure!0 (BitStream!12438) tuple2!22444)

(assert (=> b!275444 (= lt!413576 (readBitPure!0 (BitStream!12439 (buf!7280 bs2!19) (currentByte!13453 bs1!11) (currentBit!13448 bs1!11))))))

(declare-fun lt!413575 () tuple2!22444)

(assert (=> b!275444 (= lt!413575 (readBitPure!0 bs1!11))))

(assert (=> b!275444 (invariant!0 (currentBit!13448 bs1!11) (currentByte!13453 bs1!11) (size!6812 (buf!7280 bs2!19)))))

(declare-fun b!275445 () Bool)

(declare-fun res!228982 () Bool)

(assert (=> b!275445 (=> (not res!228982) (not e!195412))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275445 (= res!228982 (validate_offset_bit!0 ((_ sign_extend 32) (size!6812 (buf!7280 bs1!11))) ((_ sign_extend 32) (currentByte!13453 bs1!11)) ((_ sign_extend 32) (currentBit!13448 bs1!11))))))

(assert (= (and start!61168 res!228980) b!275445))

(assert (= (and b!275445 res!228982) b!275441))

(assert (= (and b!275441 res!228981) b!275444))

(assert (= start!61168 b!275443))

(assert (= start!61168 b!275442))

(declare-fun m!408071 () Bool)

(assert (=> b!275442 m!408071))

(declare-fun m!408073 () Bool)

(assert (=> b!275441 m!408073))

(declare-fun m!408075 () Bool)

(assert (=> b!275441 m!408075))

(declare-fun m!408077 () Bool)

(assert (=> start!61168 m!408077))

(declare-fun m!408079 () Bool)

(assert (=> start!61168 m!408079))

(declare-fun m!408081 () Bool)

(assert (=> b!275444 m!408081))

(declare-fun m!408083 () Bool)

(assert (=> b!275444 m!408083))

(declare-fun m!408085 () Bool)

(assert (=> b!275444 m!408085))

(declare-fun m!408087 () Bool)

(assert (=> b!275444 m!408087))

(declare-fun m!408089 () Bool)

(assert (=> b!275443 m!408089))

(declare-fun m!408091 () Bool)

(assert (=> b!275445 m!408091))

(check-sat (not b!275442) (not start!61168) (not b!275443) (not b!275445) (not b!275441) (not b!275444))
