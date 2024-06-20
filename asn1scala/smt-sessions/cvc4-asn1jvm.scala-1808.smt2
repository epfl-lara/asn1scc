; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48964 () Bool)

(assert start!48964)

(declare-fun b!232112 () Bool)

(declare-fun res!194334 () Bool)

(declare-fun e!159735 () Bool)

(assert (=> b!232112 (=> (not res!194334) (not e!159735))))

(declare-datatypes ((array!11933 0))(
  ( (array!11934 (arr!6219 (Array (_ BitVec 32) (_ BitVec 8))) (size!5232 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9560 0))(
  ( (BitStream!9561 (buf!5773 array!11933) (currentByte!10780 (_ BitVec 32)) (currentBit!10775 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9560)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232112 (= res!194334 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5232 (buf!5773 b1!101))) ((_ sign_extend 32) (currentByte!10780 b1!101)) ((_ sign_extend 32) (currentBit!10775 b1!101)) bytes!19))))

(declare-fun b!232113 () Bool)

(declare-fun e!159736 () Bool)

(declare-fun array_inv!4973 (array!11933) Bool)

(assert (=> b!232113 (= e!159736 (array_inv!4973 (buf!5773 b1!101)))))

(declare-fun res!194333 () Bool)

(declare-fun e!159732 () Bool)

(assert (=> start!48964 (=> (not res!194333) (not e!159732))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9560)

(assert (=> start!48964 (= res!194333 (and (= (size!5232 (buf!5773 b1!101)) (size!5232 (buf!5773 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48964 e!159732))

(declare-fun inv!12 (BitStream!9560) Bool)

(assert (=> start!48964 (and (inv!12 b1!101) e!159736)))

(declare-fun e!159737 () Bool)

(assert (=> start!48964 (and (inv!12 b2!99) e!159737)))

(assert (=> start!48964 true))

(declare-fun b!232114 () Bool)

(assert (=> b!232114 (= e!159737 (array_inv!4973 (buf!5773 b2!99)))))

(declare-fun b!232115 () Bool)

(declare-fun res!194330 () Bool)

(assert (=> b!232115 (=> (not res!194330) (not e!159735))))

(declare-fun lt!368859 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232115 (= res!194330 (= lt!368859 (bvadd (bitIndex!0 (size!5232 (buf!5773 b1!101)) (currentByte!10780 b1!101) (currentBit!10775 b1!101)) bits!86)))))

(declare-fun b!232116 () Bool)

(declare-fun res!194332 () Bool)

(assert (=> b!232116 (=> (not res!194332) (not e!159735))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232116 (= res!194332 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5232 (buf!5773 b1!101))) ((_ sign_extend 32) (currentByte!10780 b1!101)) ((_ sign_extend 32) (currentBit!10775 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232117 () Bool)

(assert (=> b!232117 (= e!159732 e!159735)))

(declare-fun res!194331 () Bool)

(assert (=> b!232117 (=> (not res!194331) (not e!159735))))

(assert (=> b!232117 (= res!194331 (and (bvsle bits!86 lt!368859) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!232117 (= lt!368859 (bitIndex!0 (size!5232 (buf!5773 b2!99)) (currentByte!10780 b2!99) (currentBit!10775 b2!99)))))

(declare-fun lt!368858 () (_ BitVec 64))

(declare-fun b!232118 () Bool)

(assert (=> b!232118 (= e!159735 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5232 (buf!5773 b1!101)))) lt!368858) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14345 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10780 b2!99))) ((_ sign_extend 32) (currentBit!10775 b2!99))))) (and (= lt!368859 bdg!14345) (= (bvsub lt!368859 bits!86) lt!368858) (let ((bdg!14346 (bvand bdg!14345 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14346 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14346 (bvand (bvsub bdg!14345 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!232118 (= lt!368858 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10780 b1!101))) ((_ sign_extend 32) (currentBit!10775 b1!101))))))

(assert (= (and start!48964 res!194333) b!232117))

(assert (= (and b!232117 res!194331) b!232112))

(assert (= (and b!232112 res!194334) b!232115))

(assert (= (and b!232115 res!194330) b!232116))

(assert (= (and b!232116 res!194332) b!232118))

(assert (= start!48964 b!232113))

(assert (= start!48964 b!232114))

(declare-fun m!355075 () Bool)

(assert (=> start!48964 m!355075))

(declare-fun m!355077 () Bool)

(assert (=> start!48964 m!355077))

(declare-fun m!355079 () Bool)

(assert (=> b!232115 m!355079))

(declare-fun m!355081 () Bool)

(assert (=> b!232114 m!355081))

(declare-fun m!355083 () Bool)

(assert (=> b!232113 m!355083))

(declare-fun m!355085 () Bool)

(assert (=> b!232117 m!355085))

(declare-fun m!355087 () Bool)

(assert (=> b!232112 m!355087))

(declare-fun m!355089 () Bool)

(assert (=> b!232116 m!355089))

(push 1)

(assert (not b!232115))

(assert (not b!232112))

(assert (not start!48964))

(assert (not b!232113))

(assert (not b!232114))

(assert (not b!232117))

(assert (not b!232116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

