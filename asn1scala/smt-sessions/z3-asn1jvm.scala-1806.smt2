; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48950 () Bool)

(assert start!48950)

(declare-fun b!231965 () Bool)

(declare-fun e!159606 () Bool)

(declare-datatypes ((array!11919 0))(
  ( (array!11920 (arr!6212 (Array (_ BitVec 32) (_ BitVec 8))) (size!5225 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9546 0))(
  ( (BitStream!9547 (buf!5766 array!11919) (currentByte!10773 (_ BitVec 32)) (currentBit!10768 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9546)

(declare-fun array_inv!4966 (array!11919) Bool)

(assert (=> b!231965 (= e!159606 (array_inv!4966 (buf!5766 b1!101)))))

(declare-fun b!231966 () Bool)

(declare-fun res!194228 () Bool)

(declare-fun e!159610 () Bool)

(assert (=> b!231966 (=> (not res!194228) (not e!159610))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231966 (= res!194228 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5225 (buf!5766 b1!101))) ((_ sign_extend 32) (currentByte!10773 b1!101)) ((_ sign_extend 32) (currentBit!10768 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!194225 () Bool)

(declare-fun e!159608 () Bool)

(assert (=> start!48950 (=> (not res!194225) (not e!159608))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9546)

(assert (=> start!48950 (= res!194225 (and (= (size!5225 (buf!5766 b1!101)) (size!5225 (buf!5766 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48950 e!159608))

(declare-fun inv!12 (BitStream!9546) Bool)

(assert (=> start!48950 (and (inv!12 b1!101) e!159606)))

(declare-fun e!159607 () Bool)

(assert (=> start!48950 (and (inv!12 b2!99) e!159607)))

(assert (=> start!48950 true))

(declare-fun b!231967 () Bool)

(declare-fun res!194229 () Bool)

(assert (=> b!231967 (=> (not res!194229) (not e!159610))))

(declare-fun lt!368817 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231967 (= res!194229 (= lt!368817 (bvadd (bitIndex!0 (size!5225 (buf!5766 b1!101)) (currentByte!10773 b1!101) (currentBit!10768 b1!101)) bits!86)))))

(declare-fun b!231968 () Bool)

(declare-fun res!194226 () Bool)

(assert (=> b!231968 (=> (not res!194226) (not e!159610))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231968 (= res!194226 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5225 (buf!5766 b1!101))) ((_ sign_extend 32) (currentByte!10773 b1!101)) ((_ sign_extend 32) (currentBit!10768 b1!101)) bytes!19))))

(declare-fun b!231969 () Bool)

(assert (=> b!231969 (= e!159608 e!159610)))

(declare-fun res!194227 () Bool)

(assert (=> b!231969 (=> (not res!194227) (not e!159610))))

(assert (=> b!231969 (= res!194227 (and (bvsle bits!86 lt!368817) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231969 (= lt!368817 (bitIndex!0 (size!5225 (buf!5766 b2!99)) (currentByte!10773 b2!99) (currentBit!10768 b2!99)))))

(declare-fun lt!368816 () (_ BitVec 64))

(declare-fun b!231970 () Bool)

(assert (=> b!231970 (= e!159610 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5225 (buf!5766 b1!101)))) lt!368816) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14337 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10773 b2!99))))) (and (= lt!368817 (bvadd bdg!14337 ((_ sign_extend 32) (currentBit!10768 b2!99)))) (= (bvsub lt!368817 bits!86) lt!368816) (not (= ((_ sign_extend 32) (currentByte!10773 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv bdg!14337 ((_ sign_extend 32) (currentByte!10773 b2!99)))))))))))

(assert (=> b!231970 (= lt!368816 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10773 b1!101))) ((_ sign_extend 32) (currentBit!10768 b1!101))))))

(declare-fun b!231971 () Bool)

(assert (=> b!231971 (= e!159607 (array_inv!4966 (buf!5766 b2!99)))))

(assert (= (and start!48950 res!194225) b!231969))

(assert (= (and b!231969 res!194227) b!231968))

(assert (= (and b!231968 res!194226) b!231967))

(assert (= (and b!231967 res!194229) b!231966))

(assert (= (and b!231966 res!194228) b!231970))

(assert (= start!48950 b!231965))

(assert (= start!48950 b!231971))

(declare-fun m!354963 () Bool)

(assert (=> b!231967 m!354963))

(declare-fun m!354965 () Bool)

(assert (=> b!231966 m!354965))

(declare-fun m!354967 () Bool)

(assert (=> b!231965 m!354967))

(declare-fun m!354969 () Bool)

(assert (=> b!231968 m!354969))

(declare-fun m!354971 () Bool)

(assert (=> b!231971 m!354971))

(declare-fun m!354973 () Bool)

(assert (=> b!231969 m!354973))

(declare-fun m!354975 () Bool)

(assert (=> start!48950 m!354975))

(declare-fun m!354977 () Bool)

(assert (=> start!48950 m!354977))

(check-sat (not b!231966) (not b!231967) (not start!48950) (not b!231968) (not b!231971) (not b!231965) (not b!231969))
(check-sat)
