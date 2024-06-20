; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49098 () Bool)

(assert start!49098)

(declare-fun b!233185 () Bool)

(declare-fun res!195092 () Bool)

(declare-fun e!160638 () Bool)

(assert (=> b!233185 (=> (not res!195092) (not e!160638))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!12040 0))(
  ( (array!12041 (arr!6271 (Array (_ BitVec 32) (_ BitVec 8))) (size!5284 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9664 0))(
  ( (BitStream!9665 (buf!5825 array!12040) (currentByte!10841 (_ BitVec 32)) (currentBit!10836 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9664)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233185 (= res!195092 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5284 (buf!5825 b1!101))) ((_ sign_extend 32) (currentByte!10841 b1!101)) ((_ sign_extend 32) (currentBit!10836 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369201 () (_ BitVec 64))

(declare-fun b!233186 () Bool)

(declare-fun lt!369199 () (_ BitVec 64))

(declare-fun lt!369200 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9664)

(assert (=> b!233186 (= e!160638 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5284 (buf!5825 b1!101)))) lt!369201) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14402 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10841 b2!99))) ((_ sign_extend 32) (currentBit!10836 b2!99))))) (and (= lt!369200 bdg!14402) (= (bvsub lt!369200 bits!86) lt!369201) (let ((bdg!14403 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5284 (buf!5825 b2!99)))))) (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub bdg!14403 (bvsub bdg!14402 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub bdg!14403 bdg!14402) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369199)) (bvslt lt!369199 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!369199 #b1111111111111111111111111111111110000000000000000000000000000000)))))))))

(assert (=> b!233186 (= lt!369201 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10841 b1!101))) ((_ sign_extend 32) (currentBit!10836 b1!101))))))

(declare-fun b!233188 () Bool)

(declare-fun e!160642 () Bool)

(assert (=> b!233188 (= e!160642 e!160638)))

(declare-fun res!195095 () Bool)

(assert (=> b!233188 (=> (not res!195095) (not e!160638))))

(assert (=> b!233188 (= res!195095 (bvsle ((_ extract 31 0) lt!369199) bytes!19))))

(assert (=> b!233188 (= lt!369199 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233189 () Bool)

(declare-fun e!160639 () Bool)

(declare-fun array_inv!5025 (array!12040) Bool)

(assert (=> b!233189 (= e!160639 (array_inv!5025 (buf!5825 b1!101)))))

(declare-fun b!233190 () Bool)

(declare-fun res!195091 () Bool)

(assert (=> b!233190 (=> (not res!195091) (not e!160638))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233190 (= res!195091 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5284 (buf!5825 b1!101))) ((_ sign_extend 32) (currentByte!10841 b1!101)) ((_ sign_extend 32) (currentBit!10836 b1!101)) bytes!19))))

(declare-fun b!233191 () Bool)

(declare-fun e!160640 () Bool)

(assert (=> b!233191 (= e!160640 e!160642)))

(declare-fun res!195096 () Bool)

(assert (=> b!233191 (=> (not res!195096) (not e!160642))))

(assert (=> b!233191 (= res!195096 (bvsle bits!86 lt!369200))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233191 (= lt!369200 (bitIndex!0 (size!5284 (buf!5825 b2!99)) (currentByte!10841 b2!99) (currentBit!10836 b2!99)))))

(declare-fun b!233192 () Bool)

(declare-fun res!195094 () Bool)

(assert (=> b!233192 (=> (not res!195094) (not e!160638))))

(assert (=> b!233192 (= res!195094 (= lt!369200 (bvadd (bitIndex!0 (size!5284 (buf!5825 b1!101)) (currentByte!10841 b1!101) (currentBit!10836 b1!101)) bits!86)))))

(declare-fun res!195093 () Bool)

(assert (=> start!49098 (=> (not res!195093) (not e!160640))))

(assert (=> start!49098 (= res!195093 (and (= (size!5284 (buf!5825 b1!101)) (size!5284 (buf!5825 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49098 e!160640))

(declare-fun inv!12 (BitStream!9664) Bool)

(assert (=> start!49098 (and (inv!12 b1!101) e!160639)))

(declare-fun e!160637 () Bool)

(assert (=> start!49098 (and (inv!12 b2!99) e!160637)))

(assert (=> start!49098 true))

(declare-fun b!233187 () Bool)

(assert (=> b!233187 (= e!160637 (array_inv!5025 (buf!5825 b2!99)))))

(assert (= (and start!49098 res!195093) b!233191))

(assert (= (and b!233191 res!195096) b!233188))

(assert (= (and b!233188 res!195095) b!233190))

(assert (= (and b!233190 res!195091) b!233192))

(assert (= (and b!233192 res!195094) b!233185))

(assert (= (and b!233185 res!195092) b!233186))

(assert (= start!49098 b!233189))

(assert (= start!49098 b!233187))

(declare-fun m!355877 () Bool)

(assert (=> b!233189 m!355877))

(declare-fun m!355879 () Bool)

(assert (=> start!49098 m!355879))

(declare-fun m!355881 () Bool)

(assert (=> start!49098 m!355881))

(declare-fun m!355883 () Bool)

(assert (=> b!233192 m!355883))

(declare-fun m!355885 () Bool)

(assert (=> b!233187 m!355885))

(declare-fun m!355887 () Bool)

(assert (=> b!233185 m!355887))

(declare-fun m!355889 () Bool)

(assert (=> b!233191 m!355889))

(declare-fun m!355891 () Bool)

(assert (=> b!233190 m!355891))

(push 1)

(assert (not b!233191))

(assert (not b!233190))

(assert (not b!233192))

(assert (not b!233185))

(assert (not b!233189))

(assert (not start!49098))

(assert (not b!233187))

(check-sat)

(pop 1)

(push 1)

(check-sat)

