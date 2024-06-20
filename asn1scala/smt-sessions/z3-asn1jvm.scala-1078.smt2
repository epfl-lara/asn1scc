; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31044 () Bool)

(assert start!31044)

(declare-fun b!156713 () Bool)

(declare-fun e!105960 () Bool)

(declare-fun e!105961 () Bool)

(assert (=> b!156713 (= e!105960 e!105961)))

(declare-fun res!130979 () Bool)

(assert (=> b!156713 (=> (not res!130979) (not e!105961))))

(declare-datatypes ((array!7202 0))(
  ( (array!7203 (arr!4095 (Array (_ BitVec 32) (_ BitVec 8))) (size!3230 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5718 0))(
  ( (BitStream!5719 (buf!3733 array!7202) (currentByte!6860 (_ BitVec 32)) (currentBit!6855 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5718)

(declare-fun lt!245325 () BitStream!5718)

(assert (=> b!156713 (= res!130979 (= (size!3230 (buf!3733 bs!65)) (size!3230 (buf!3733 lt!245325))))))

(declare-datatypes ((tuple2!14060 0))(
  ( (tuple2!14061 (_1!7474 BitStream!5718) (_2!7474 (_ BitVec 8))) )
))
(declare-fun lt!245323 () tuple2!14060)

(declare-fun readBytePure!0 (BitStream!5718) tuple2!14060)

(assert (=> b!156713 (= lt!245323 (readBytePure!0 lt!245325))))

(declare-fun b!156714 () Bool)

(declare-fun res!130977 () Bool)

(declare-fun e!105965 () Bool)

(assert (=> b!156714 (=> (not res!130977) (not e!105965))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156714 (= res!130977 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3230 (buf!3733 bs!65))) ((_ sign_extend 32) (currentByte!6860 bs!65)) ((_ sign_extend 32) (currentBit!6855 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!156715 () Bool)

(declare-fun e!105964 () Bool)

(declare-fun array_inv!3019 (array!7202) Bool)

(assert (=> b!156715 (= e!105964 (array_inv!3019 (buf!3733 bs!65)))))

(declare-fun res!130976 () Bool)

(assert (=> start!31044 (=> (not res!130976) (not e!105965))))

(declare-fun arr!153 () array!7202)

(assert (=> start!31044 (= res!130976 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3230 arr!153))))))

(assert (=> start!31044 e!105965))

(assert (=> start!31044 true))

(assert (=> start!31044 (array_inv!3019 arr!153)))

(declare-fun inv!12 (BitStream!5718) Bool)

(assert (=> start!31044 (and (inv!12 bs!65) e!105964)))

(declare-fun b!156716 () Bool)

(assert (=> b!156716 (= e!105965 e!105960)))

(declare-fun res!130975 () Bool)

(assert (=> b!156716 (=> (not res!130975) (not e!105960))))

(assert (=> b!156716 (= res!130975 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14062 0))(
  ( (tuple2!14063 (_1!7475 BitStream!5718) (_2!7475 array!7202)) )
))
(declare-fun lt!245324 () tuple2!14062)

(declare-fun readByteArrayLoopPure!0 (BitStream!5718 array!7202 (_ BitVec 32) (_ BitVec 32)) tuple2!14062)

(assert (=> b!156716 (= lt!245324 (readByteArrayLoopPure!0 lt!245325 (array!7203 (store (arr!4095 arr!153) from!240 (_2!7474 (readBytePure!0 bs!65))) (size!3230 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5718 (_ BitVec 32)) BitStream!5718)

(assert (=> b!156716 (= lt!245325 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245326 () tuple2!14062)

(assert (=> b!156716 (= lt!245326 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156717 () Bool)

(declare-fun res!130978 () Bool)

(assert (=> b!156717 (=> (not res!130978) (not e!105961))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156717 (= res!130978 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3230 (buf!3733 lt!245325)) (currentByte!6860 lt!245325) (currentBit!6855 lt!245325))))))

(declare-fun b!156718 () Bool)

(assert (=> b!156718 (= e!105961 false)))

(declare-fun lt!245322 () (_ BitVec 64))

(assert (=> b!156718 (= lt!245322 (bitIndex!0 (size!3230 (buf!3733 bs!65)) (currentByte!6860 bs!65) (currentBit!6855 bs!65)))))

(assert (= (and start!31044 res!130976) b!156714))

(assert (= (and b!156714 res!130977) b!156716))

(assert (= (and b!156716 res!130975) b!156713))

(assert (= (and b!156713 res!130979) b!156717))

(assert (= (and b!156717 res!130978) b!156718))

(assert (= start!31044 b!156715))

(declare-fun m!244329 () Bool)

(assert (=> b!156714 m!244329))

(declare-fun m!244331 () Bool)

(assert (=> b!156716 m!244331))

(declare-fun m!244333 () Bool)

(assert (=> b!156716 m!244333))

(declare-fun m!244335 () Bool)

(assert (=> b!156716 m!244335))

(declare-fun m!244337 () Bool)

(assert (=> b!156716 m!244337))

(declare-fun m!244339 () Bool)

(assert (=> b!156716 m!244339))

(declare-fun m!244341 () Bool)

(assert (=> b!156715 m!244341))

(declare-fun m!244343 () Bool)

(assert (=> b!156713 m!244343))

(declare-fun m!244345 () Bool)

(assert (=> b!156717 m!244345))

(declare-fun m!244347 () Bool)

(assert (=> start!31044 m!244347))

(declare-fun m!244349 () Bool)

(assert (=> start!31044 m!244349))

(declare-fun m!244351 () Bool)

(assert (=> b!156718 m!244351))

(check-sat (not b!156716) (not b!156713) (not b!156715) (not b!156717) (not b!156718) (not start!31044) (not b!156714))
