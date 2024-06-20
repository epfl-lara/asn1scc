; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31042 () Bool)

(assert start!31042)

(declare-fun b!156695 () Bool)

(declare-fun e!105943 () Bool)

(declare-fun e!105944 () Bool)

(assert (=> b!156695 (= e!105943 e!105944)))

(declare-fun res!130960 () Bool)

(assert (=> b!156695 (=> (not res!130960) (not e!105944))))

(declare-datatypes ((array!7200 0))(
  ( (array!7201 (arr!4094 (Array (_ BitVec 32) (_ BitVec 8))) (size!3229 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5716 0))(
  ( (BitStream!5717 (buf!3732 array!7200) (currentByte!6859 (_ BitVec 32)) (currentBit!6854 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5716)

(declare-fun lt!245308 () BitStream!5716)

(assert (=> b!156695 (= res!130960 (= (size!3229 (buf!3732 bs!65)) (size!3229 (buf!3732 lt!245308))))))

(declare-datatypes ((tuple2!14056 0))(
  ( (tuple2!14057 (_1!7472 BitStream!5716) (_2!7472 (_ BitVec 8))) )
))
(declare-fun lt!245311 () tuple2!14056)

(declare-fun readBytePure!0 (BitStream!5716) tuple2!14056)

(assert (=> b!156695 (= lt!245311 (readBytePure!0 lt!245308))))

(declare-fun b!156696 () Bool)

(declare-fun e!105945 () Bool)

(assert (=> b!156696 (= e!105945 e!105943)))

(declare-fun res!130961 () Bool)

(assert (=> b!156696 (=> (not res!130961) (not e!105943))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(assert (=> b!156696 (= res!130961 (not (= from!240 (bvsub to!236 #b00000000000000000000000000000001))))))

(declare-datatypes ((tuple2!14058 0))(
  ( (tuple2!14059 (_1!7473 BitStream!5716) (_2!7473 array!7200)) )
))
(declare-fun lt!245307 () tuple2!14058)

(declare-fun arr!153 () array!7200)

(declare-fun readByteArrayLoopPure!0 (BitStream!5716 array!7200 (_ BitVec 32) (_ BitVec 32)) tuple2!14058)

(assert (=> b!156696 (= lt!245307 (readByteArrayLoopPure!0 lt!245308 (array!7201 (store (arr!4094 arr!153) from!240 (_2!7472 (readBytePure!0 bs!65))) (size!3229 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun withMovedByteIndex!0 (BitStream!5716 (_ BitVec 32)) BitStream!5716)

(assert (=> b!156696 (= lt!245308 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001))))

(declare-fun lt!245310 () tuple2!14058)

(assert (=> b!156696 (= lt!245310 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!156697 () Bool)

(declare-fun res!130962 () Bool)

(assert (=> b!156697 (=> (not res!130962) (not e!105945))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!156697 (= res!130962 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3229 (buf!3732 bs!65))) ((_ sign_extend 32) (currentByte!6859 bs!65)) ((_ sign_extend 32) (currentBit!6854 bs!65)) (bvsub to!236 from!240)))))

(declare-fun res!130964 () Bool)

(assert (=> start!31042 (=> (not res!130964) (not e!105945))))

(assert (=> start!31042 (= res!130964 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3229 arr!153))))))

(assert (=> start!31042 e!105945))

(assert (=> start!31042 true))

(declare-fun array_inv!3018 (array!7200) Bool)

(assert (=> start!31042 (array_inv!3018 arr!153)))

(declare-fun e!105946 () Bool)

(declare-fun inv!12 (BitStream!5716) Bool)

(assert (=> start!31042 (and (inv!12 bs!65) e!105946)))

(declare-fun b!156698 () Bool)

(assert (=> b!156698 (= e!105946 (array_inv!3018 (buf!3732 bs!65)))))

(declare-fun b!156699 () Bool)

(declare-fun res!130963 () Bool)

(assert (=> b!156699 (=> (not res!130963) (not e!105944))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!156699 (= res!130963 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3229 (buf!3732 lt!245308)) (currentByte!6859 lt!245308) (currentBit!6854 lt!245308))))))

(declare-fun b!156700 () Bool)

(assert (=> b!156700 (= e!105944 false)))

(declare-fun lt!245309 () (_ BitVec 64))

(assert (=> b!156700 (= lt!245309 (bitIndex!0 (size!3229 (buf!3732 bs!65)) (currentByte!6859 bs!65) (currentBit!6854 bs!65)))))

(assert (= (and start!31042 res!130964) b!156697))

(assert (= (and b!156697 res!130962) b!156696))

(assert (= (and b!156696 res!130961) b!156695))

(assert (= (and b!156695 res!130960) b!156699))

(assert (= (and b!156699 res!130963) b!156700))

(assert (= start!31042 b!156698))

(declare-fun m!244305 () Bool)

(assert (=> b!156697 m!244305))

(declare-fun m!244307 () Bool)

(assert (=> start!31042 m!244307))

(declare-fun m!244309 () Bool)

(assert (=> start!31042 m!244309))

(declare-fun m!244311 () Bool)

(assert (=> b!156698 m!244311))

(declare-fun m!244313 () Bool)

(assert (=> b!156696 m!244313))

(declare-fun m!244315 () Bool)

(assert (=> b!156696 m!244315))

(declare-fun m!244317 () Bool)

(assert (=> b!156696 m!244317))

(declare-fun m!244319 () Bool)

(assert (=> b!156696 m!244319))

(declare-fun m!244321 () Bool)

(assert (=> b!156696 m!244321))

(declare-fun m!244323 () Bool)

(assert (=> b!156700 m!244323))

(declare-fun m!244325 () Bool)

(assert (=> b!156695 m!244325))

(declare-fun m!244327 () Bool)

(assert (=> b!156699 m!244327))

(push 1)

(assert (not start!31042))

(assert (not b!156696))

(assert (not b!156695))

(assert (not b!156700))

(assert (not b!156698))

(assert (not b!156699))

(assert (not b!156697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

