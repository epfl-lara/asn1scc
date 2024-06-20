; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31024 () Bool)

(assert start!31024)

(declare-fun b!156533 () Bool)

(declare-fun e!105781 () Bool)

(declare-fun e!105783 () Bool)

(assert (=> b!156533 (= e!105781 e!105783)))

(declare-fun res!130828 () Bool)

(assert (=> b!156533 (=> (not res!130828) (not e!105783))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156533 (= res!130828 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((array!7182 0))(
  ( (array!7183 (arr!4085 (Array (_ BitVec 32) (_ BitVec 8))) (size!3220 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5698 0))(
  ( (BitStream!5699 (buf!3723 array!7182) (currentByte!6850 (_ BitVec 32)) (currentBit!6845 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!14020 0))(
  ( (tuple2!14021 (_1!7454 BitStream!5698) (_2!7454 array!7182)) )
))
(declare-fun lt!245175 () tuple2!14020)

(declare-fun bs!65 () BitStream!5698)

(declare-fun lt!245173 () BitStream!5698)

(declare-fun arr!153 () array!7182)

(declare-fun readByteArrayLoopPure!0 (BitStream!5698 array!7182 (_ BitVec 32) (_ BitVec 32)) tuple2!14020)

(declare-datatypes ((tuple2!14022 0))(
  ( (tuple2!14023 (_1!7455 BitStream!5698) (_2!7455 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5698) tuple2!14022)

(assert (=> b!156533 (= lt!245175 (readByteArrayLoopPure!0 lt!245173 (array!7183 (store (arr!4085 arr!153) from!240 (_2!7455 (readBytePure!0 bs!65))) (size!3220 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5698 (_ BitVec 32)) BitStream!5698)

(assert (=> b!156533 (= lt!245173 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245172 () tuple2!14020)

(assert (=> b!156533 (= lt!245172 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156534 () Bool)

(declare-fun e!105782 () Bool)

(assert (=> b!156534 (= e!105783 e!105782)))

(declare-fun res!130825 () Bool)

(assert (=> b!156534 (=> (not res!130825) (not e!105782))))

(assert (=> b!156534 (= res!130825 (= (size!3220 (buf!3723 bs!65)) (size!3220 (buf!3723 lt!245173))))))

(declare-fun lt!245174 () tuple2!14022)

(assert (=> b!156534 (= lt!245174 (readBytePure!0 lt!245173))))

(declare-fun b!156535 () Bool)

(assert (=> b!156535 (= e!105782 false)))

(declare-fun lt!245176 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156535 (= lt!245176 (bitIndex!0 (size!3220 (buf!3723 bs!65)) (currentByte!6850 bs!65) (currentBit!6845 bs!65)))))

(declare-fun res!130827 () Bool)

(assert (=> start!31024 (=> (not res!130827) (not e!105781))))

(assert (=> start!31024 (= res!130827 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3220 arr!153))))))

(assert (=> start!31024 e!105781))

(assert (=> start!31024 true))

(declare-fun array_inv!3009 (array!7182) Bool)

(assert (=> start!31024 (array_inv!3009 arr!153)))

(declare-fun e!105780 () Bool)

(declare-fun inv!12 (BitStream!5698) Bool)

(assert (=> start!31024 (and (inv!12 bs!65) e!105780)))

(declare-fun b!156536 () Bool)

(declare-fun res!130826 () Bool)

(assert (=> b!156536 (=> (not res!130826) (not e!105782))))

(assert (=> b!156536 (= res!130826 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3220 (buf!3723 lt!245173)) (currentByte!6850 lt!245173) (currentBit!6845 lt!245173))))))

(declare-fun b!156537 () Bool)

(assert (=> b!156537 (= e!105780 (array_inv!3009 (buf!3723 bs!65)))))

(declare-fun b!156538 () Bool)

(declare-fun res!130829 () Bool)

(assert (=> b!156538 (=> (not res!130829) (not e!105781))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156538 (= res!130829 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3220 (buf!3723 bs!65))) ((_ sign_extend 32) (currentByte!6850 bs!65)) ((_ sign_extend 32) (currentBit!6845 bs!65)) (bvsub to!236 from!240)))))

(assert (= (and start!31024 res!130827) b!156538))

(assert (= (and b!156538 res!130829) b!156533))

(assert (= (and b!156533 res!130828) b!156534))

(assert (= (and b!156534 res!130825) b!156536))

(assert (= (and b!156536 res!130826) b!156535))

(assert (= start!31024 b!156537))

(declare-fun m!244089 () Bool)

(assert (=> b!156533 m!244089))

(declare-fun m!244091 () Bool)

(assert (=> b!156533 m!244091))

(declare-fun m!244093 () Bool)

(assert (=> b!156533 m!244093))

(declare-fun m!244095 () Bool)

(assert (=> b!156533 m!244095))

(declare-fun m!244097 () Bool)

(assert (=> b!156533 m!244097))

(declare-fun m!244099 () Bool)

(assert (=> b!156534 m!244099))

(declare-fun m!244101 () Bool)

(assert (=> b!156538 m!244101))

(declare-fun m!244103 () Bool)

(assert (=> b!156536 m!244103))

(declare-fun m!244105 () Bool)

(assert (=> start!31024 m!244105))

(declare-fun m!244107 () Bool)

(assert (=> start!31024 m!244107))

(declare-fun m!244109 () Bool)

(assert (=> b!156537 m!244109))

(declare-fun m!244111 () Bool)

(assert (=> b!156535 m!244111))

(push 1)

(assert (not start!31024))

(assert (not b!156535))

(assert (not b!156533))

(assert (not b!156536))

(assert (not b!156537))

(assert (not b!156538))

(assert (not b!156534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

