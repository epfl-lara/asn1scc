; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48960 () Bool)

(assert start!48960)

(declare-fun b!232070 () Bool)

(declare-fun e!159700 () Bool)

(declare-datatypes ((array!11929 0))(
  ( (array!11930 (arr!6217 (Array (_ BitVec 32) (_ BitVec 8))) (size!5230 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9556 0))(
  ( (BitStream!9557 (buf!5771 array!11929) (currentByte!10778 (_ BitVec 32)) (currentBit!10773 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9556)

(declare-fun array_inv!4971 (array!11929) Bool)

(assert (=> b!232070 (= e!159700 (array_inv!4971 (buf!5771 b2!99)))))

(declare-fun b!232071 () Bool)

(declare-fun e!159696 () Bool)

(declare-fun e!159699 () Bool)

(assert (=> b!232071 (= e!159696 e!159699)))

(declare-fun res!194301 () Bool)

(assert (=> b!232071 (=> (not res!194301) (not e!159699))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368846 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!232071 (= res!194301 (and (bvsle bits!86 lt!368846) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232071 (= lt!368846 (bitIndex!0 (size!5230 (buf!5771 b2!99)) (currentByte!10778 b2!99) (currentBit!10773 b2!99)))))

(declare-fun res!194302 () Bool)

(assert (=> start!48960 (=> (not res!194302) (not e!159696))))

(declare-fun b1!101 () BitStream!9556)

(assert (=> start!48960 (= res!194302 (and (= (size!5230 (buf!5771 b1!101)) (size!5230 (buf!5771 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48960 e!159696))

(declare-fun e!159698 () Bool)

(declare-fun inv!12 (BitStream!9556) Bool)

(assert (=> start!48960 (and (inv!12 b1!101) e!159698)))

(assert (=> start!48960 (and (inv!12 b2!99) e!159700)))

(assert (=> start!48960 true))

(declare-fun b!232072 () Bool)

(declare-fun res!194304 () Bool)

(assert (=> b!232072 (=> (not res!194304) (not e!159699))))

(assert (=> b!232072 (= res!194304 (= lt!368846 (bvadd (bitIndex!0 (size!5230 (buf!5771 b1!101)) (currentByte!10778 b1!101) (currentBit!10773 b1!101)) bits!86)))))

(declare-fun b!232073 () Bool)

(declare-fun res!194300 () Bool)

(assert (=> b!232073 (=> (not res!194300) (not e!159699))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232073 (= res!194300 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5230 (buf!5771 b1!101))) ((_ sign_extend 32) (currentByte!10778 b1!101)) ((_ sign_extend 32) (currentBit!10773 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232074 () Bool)

(declare-fun res!194303 () Bool)

(assert (=> b!232074 (=> (not res!194303) (not e!159699))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232074 (= res!194303 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5230 (buf!5771 b1!101))) ((_ sign_extend 32) (currentByte!10778 b1!101)) ((_ sign_extend 32) (currentBit!10773 b1!101)) bytes!19))))

(declare-fun b!232075 () Bool)

(declare-fun lt!368847 () (_ BitVec 64))

(assert (=> b!232075 (= e!159699 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5230 (buf!5771 b1!101)))) lt!368847) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14345 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10778 b2!99))) ((_ sign_extend 32) (currentBit!10773 b2!99))))) (and (= lt!368846 bdg!14345) (= (bvsub lt!368846 bits!86) lt!368847) (let ((bdg!14346 (bvand bdg!14345 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (not (= bdg!14346 (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= bdg!14346 (bvand (bvsub bdg!14345 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (=> b!232075 (= lt!368847 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10778 b1!101))) ((_ sign_extend 32) (currentBit!10773 b1!101))))))

(declare-fun b!232076 () Bool)

(assert (=> b!232076 (= e!159698 (array_inv!4971 (buf!5771 b1!101)))))

(assert (= (and start!48960 res!194302) b!232071))

(assert (= (and b!232071 res!194301) b!232074))

(assert (= (and b!232074 res!194303) b!232072))

(assert (= (and b!232072 res!194304) b!232073))

(assert (= (and b!232073 res!194300) b!232075))

(assert (= start!48960 b!232076))

(assert (= start!48960 b!232070))

(declare-fun m!355043 () Bool)

(assert (=> b!232074 m!355043))

(declare-fun m!355045 () Bool)

(assert (=> b!232076 m!355045))

(declare-fun m!355047 () Bool)

(assert (=> b!232072 m!355047))

(declare-fun m!355049 () Bool)

(assert (=> b!232070 m!355049))

(declare-fun m!355051 () Bool)

(assert (=> b!232071 m!355051))

(declare-fun m!355053 () Bool)

(assert (=> start!48960 m!355053))

(declare-fun m!355055 () Bool)

(assert (=> start!48960 m!355055))

(declare-fun m!355057 () Bool)

(assert (=> b!232073 m!355057))

(push 1)

(assert (not b!232072))

(assert (not b!232070))

(assert (not b!232076))

(assert (not b!232071))

(assert (not b!232074))

(assert (not b!232073))

(assert (not start!48960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

