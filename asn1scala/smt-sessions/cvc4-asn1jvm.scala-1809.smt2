; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48970 () Bool)

(assert start!48970)

(declare-fun b!232175 () Bool)

(declare-fun res!194378 () Bool)

(declare-fun e!159789 () Bool)

(assert (=> b!232175 (=> (not res!194378) (not e!159789))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11939 0))(
  ( (array!11940 (arr!6222 (Array (_ BitVec 32) (_ BitVec 8))) (size!5235 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9566 0))(
  ( (BitStream!9567 (buf!5776 array!11939) (currentByte!10783 (_ BitVec 32)) (currentBit!10778 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9566)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232175 (= res!194378 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5235 (buf!5776 b1!101))) ((_ sign_extend 32) (currentByte!10783 b1!101)) ((_ sign_extend 32) (currentBit!10778 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b!232176 () Bool)

(declare-fun lt!368877 () (_ BitVec 64))

(declare-fun lt!368876 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9566)

(assert (=> b!232176 (= e!159789 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5235 (buf!5776 b1!101)))) lt!368877) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14349 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10783 b2!99))) ((_ sign_extend 32) (currentBit!10778 b2!99))))) (and (= lt!368876 bdg!14349) (= (bvsub lt!368876 bits!86) lt!368877) (let ((bdg!14350 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5235 (buf!5776 b2!99)))))) (let ((bdg!14351 (bvsub bdg!14349 bits!86))) (let ((bdg!14352 (bvand bdg!14350 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14352 (bvand bdg!14351 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14352 (bvand (bvsub bdg!14350 bdg!14351) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))))

(assert (=> b!232176 (= lt!368877 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10783 b1!101))) ((_ sign_extend 32) (currentBit!10778 b1!101))))))

(declare-fun b!232177 () Bool)

(declare-fun e!159787 () Bool)

(declare-fun array_inv!4976 (array!11939) Bool)

(assert (=> b!232177 (= e!159787 (array_inv!4976 (buf!5776 b2!99)))))

(declare-fun b!232178 () Bool)

(declare-fun res!194377 () Bool)

(assert (=> b!232178 (=> (not res!194377) (not e!159789))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232178 (= res!194377 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5235 (buf!5776 b1!101))) ((_ sign_extend 32) (currentByte!10783 b1!101)) ((_ sign_extend 32) (currentBit!10778 b1!101)) bytes!19))))

(declare-fun b!232179 () Bool)

(declare-fun e!159791 () Bool)

(assert (=> b!232179 (= e!159791 (array_inv!4976 (buf!5776 b1!101)))))

(declare-fun b!232180 () Bool)

(declare-fun e!159790 () Bool)

(assert (=> b!232180 (= e!159790 e!159789)))

(declare-fun res!194375 () Bool)

(assert (=> b!232180 (=> (not res!194375) (not e!159789))))

(assert (=> b!232180 (= res!194375 (and (bvsle bits!86 lt!368876) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232180 (= lt!368876 (bitIndex!0 (size!5235 (buf!5776 b2!99)) (currentByte!10783 b2!99) (currentBit!10778 b2!99)))))

(declare-fun b!232181 () Bool)

(declare-fun res!194376 () Bool)

(assert (=> b!232181 (=> (not res!194376) (not e!159789))))

(assert (=> b!232181 (= res!194376 (= lt!368876 (bvadd (bitIndex!0 (size!5235 (buf!5776 b1!101)) (currentByte!10783 b1!101) (currentBit!10778 b1!101)) bits!86)))))

(declare-fun res!194379 () Bool)

(assert (=> start!48970 (=> (not res!194379) (not e!159790))))

(assert (=> start!48970 (= res!194379 (and (= (size!5235 (buf!5776 b1!101)) (size!5235 (buf!5776 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48970 e!159790))

(declare-fun inv!12 (BitStream!9566) Bool)

(assert (=> start!48970 (and (inv!12 b1!101) e!159791)))

(assert (=> start!48970 (and (inv!12 b2!99) e!159787)))

(assert (=> start!48970 true))

(assert (= (and start!48970 res!194379) b!232180))

(assert (= (and b!232180 res!194375) b!232178))

(assert (= (and b!232178 res!194377) b!232181))

(assert (= (and b!232181 res!194376) b!232175))

(assert (= (and b!232175 res!194378) b!232176))

(assert (= start!48970 b!232179))

(assert (= start!48970 b!232177))

(declare-fun m!355123 () Bool)

(assert (=> b!232177 m!355123))

(declare-fun m!355125 () Bool)

(assert (=> b!232178 m!355125))

(declare-fun m!355127 () Bool)

(assert (=> b!232179 m!355127))

(declare-fun m!355129 () Bool)

(assert (=> start!48970 m!355129))

(declare-fun m!355131 () Bool)

(assert (=> start!48970 m!355131))

(declare-fun m!355133 () Bool)

(assert (=> b!232180 m!355133))

(declare-fun m!355135 () Bool)

(assert (=> b!232181 m!355135))

(declare-fun m!355137 () Bool)

(assert (=> b!232175 m!355137))

(push 1)

(assert (not b!232178))

(assert (not b!232175))

(assert (not b!232180))

(assert (not b!232179))

(assert (not b!232181))

(assert (not b!232177))

(assert (not start!48970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

