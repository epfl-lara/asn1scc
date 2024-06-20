; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48966 () Bool)

(assert start!48966)

(declare-fun b!232133 () Bool)

(declare-fun e!159750 () Bool)

(declare-datatypes ((array!11935 0))(
  ( (array!11936 (arr!6220 (Array (_ BitVec 32) (_ BitVec 8))) (size!5233 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9562 0))(
  ( (BitStream!9563 (buf!5774 array!11935) (currentByte!10781 (_ BitVec 32)) (currentBit!10776 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9562)

(declare-fun array_inv!4974 (array!11935) Bool)

(assert (=> b!232133 (= e!159750 (array_inv!4974 (buf!5774 b1!101)))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368865 () (_ BitVec 64))

(declare-fun b!232134 () Bool)

(declare-fun e!159751 () Bool)

(declare-fun lt!368864 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9562)

(assert (=> b!232134 (= e!159751 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5233 (buf!5774 b1!101)))) lt!368865) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14349 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10781 b2!99))) ((_ sign_extend 32) (currentBit!10776 b2!99))))) (and (= lt!368864 bdg!14349) (= (bvsub lt!368864 bits!86) lt!368865) (let ((bdg!14350 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5233 (buf!5774 b2!99)))))) (let ((bdg!14351 (bvsub bdg!14349 bits!86))) (let ((bdg!14352 (bvand bdg!14350 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14352 (bvand bdg!14351 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14352 (bvand (bvsub bdg!14350 bdg!14351) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))))

(assert (=> b!232134 (= lt!368865 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10781 b1!101))) ((_ sign_extend 32) (currentBit!10776 b1!101))))))

(declare-fun b!232135 () Bool)

(declare-fun e!159753 () Bool)

(assert (=> b!232135 (= e!159753 e!159751)))

(declare-fun res!194348 () Bool)

(assert (=> b!232135 (=> (not res!194348) (not e!159751))))

(assert (=> b!232135 (= res!194348 (and (bvsle bits!86 lt!368864) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232135 (= lt!368864 (bitIndex!0 (size!5233 (buf!5774 b2!99)) (currentByte!10781 b2!99) (currentBit!10776 b2!99)))))

(declare-fun b!232136 () Bool)

(declare-fun res!194346 () Bool)

(assert (=> b!232136 (=> (not res!194346) (not e!159751))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232136 (= res!194346 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5233 (buf!5774 b1!101))) ((_ sign_extend 32) (currentByte!10781 b1!101)) ((_ sign_extend 32) (currentBit!10776 b1!101)) bytes!19))))

(declare-fun b!232137 () Bool)

(declare-fun e!159752 () Bool)

(assert (=> b!232137 (= e!159752 (array_inv!4974 (buf!5774 b2!99)))))

(declare-fun res!194347 () Bool)

(assert (=> start!48966 (=> (not res!194347) (not e!159753))))

(assert (=> start!48966 (= res!194347 (and (= (size!5233 (buf!5774 b1!101)) (size!5233 (buf!5774 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48966 e!159753))

(declare-fun inv!12 (BitStream!9562) Bool)

(assert (=> start!48966 (and (inv!12 b1!101) e!159750)))

(assert (=> start!48966 (and (inv!12 b2!99) e!159752)))

(assert (=> start!48966 true))

(declare-fun b!232138 () Bool)

(declare-fun res!194345 () Bool)

(assert (=> b!232138 (=> (not res!194345) (not e!159751))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232138 (= res!194345 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5233 (buf!5774 b1!101))) ((_ sign_extend 32) (currentByte!10781 b1!101)) ((_ sign_extend 32) (currentBit!10776 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232139 () Bool)

(declare-fun res!194349 () Bool)

(assert (=> b!232139 (=> (not res!194349) (not e!159751))))

(assert (=> b!232139 (= res!194349 (= lt!368864 (bvadd (bitIndex!0 (size!5233 (buf!5774 b1!101)) (currentByte!10781 b1!101) (currentBit!10776 b1!101)) bits!86)))))

(assert (= (and start!48966 res!194347) b!232135))

(assert (= (and b!232135 res!194348) b!232136))

(assert (= (and b!232136 res!194346) b!232139))

(assert (= (and b!232139 res!194349) b!232138))

(assert (= (and b!232138 res!194345) b!232134))

(assert (= start!48966 b!232133))

(assert (= start!48966 b!232137))

(declare-fun m!355091 () Bool)

(assert (=> b!232139 m!355091))

(declare-fun m!355093 () Bool)

(assert (=> start!48966 m!355093))

(declare-fun m!355095 () Bool)

(assert (=> start!48966 m!355095))

(declare-fun m!355097 () Bool)

(assert (=> b!232136 m!355097))

(declare-fun m!355099 () Bool)

(assert (=> b!232133 m!355099))

(declare-fun m!355101 () Bool)

(assert (=> b!232135 m!355101))

(declare-fun m!355103 () Bool)

(assert (=> b!232137 m!355103))

(declare-fun m!355105 () Bool)

(assert (=> b!232138 m!355105))

(push 1)

(assert (not start!48966))

(assert (not b!232136))

(assert (not b!232139))

(assert (not b!232138))

(assert (not b!232137))

(assert (not b!232133))

(assert (not b!232135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

