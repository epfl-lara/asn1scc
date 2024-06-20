; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49020 () Bool)

(assert start!49020)

(declare-fun b!232664 () Bool)

(declare-fun e!160204 () Bool)

(declare-datatypes ((array!11989 0))(
  ( (array!11990 (arr!6247 (Array (_ BitVec 32) (_ BitVec 8))) (size!5260 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9616 0))(
  ( (BitStream!9617 (buf!5801 array!11989) (currentByte!10808 (_ BitVec 32)) (currentBit!10803 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9616)

(declare-fun array_inv!5001 (array!11989) Bool)

(assert (=> b!232664 (= e!160204 (array_inv!5001 (buf!5801 b2!99)))))

(declare-fun b!232665 () Bool)

(declare-fun res!194717 () Bool)

(declare-fun e!160200 () Bool)

(assert (=> b!232665 (=> (not res!194717) (not e!160200))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b1!101 () BitStream!9616)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!232665 (= res!194717 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5260 (buf!5801 b1!101))) ((_ sign_extend 32) (currentByte!10808 b1!101)) ((_ sign_extend 32) (currentBit!10803 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!232666 () Bool)

(declare-fun e!160203 () Bool)

(assert (=> b!232666 (= e!160203 e!160200)))

(declare-fun res!194716 () Bool)

(assert (=> b!232666 (=> (not res!194716) (not e!160200))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368991 () (_ BitVec 64))

(assert (=> b!232666 (= res!194716 (and (bvsle bits!86 lt!368991) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!232666 (= lt!368991 (bitIndex!0 (size!5260 (buf!5801 b2!99)) (currentByte!10808 b2!99) (currentBit!10803 b2!99)))))

(declare-fun lt!368990 () (_ BitVec 64))

(declare-fun b!232667 () Bool)

(assert (=> b!232667 (= e!160200 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5260 (buf!5801 b1!101)))) lt!368990) #b0000000000000000000000000000000000000000000000000000000000001000)) (let ((bdg!14377 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10808 b2!99))) ((_ sign_extend 32) (currentBit!10803 b2!99))))) (and (= lt!368991 bdg!14377) (= (bvsub lt!368991 bits!86) lt!368990) (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5260 (buf!5801 b2!99)))) (bvsub bdg!14377 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!232667 (= lt!368990 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10808 b1!101))) ((_ sign_extend 32) (currentBit!10803 b1!101))))))

(declare-fun res!194718 () Bool)

(assert (=> start!49020 (=> (not res!194718) (not e!160203))))

(assert (=> start!49020 (= res!194718 (and (= (size!5260 (buf!5801 b1!101)) (size!5260 (buf!5801 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49020 e!160203))

(declare-fun e!160201 () Bool)

(declare-fun inv!12 (BitStream!9616) Bool)

(assert (=> start!49020 (and (inv!12 b1!101) e!160201)))

(assert (=> start!49020 (and (inv!12 b2!99) e!160204)))

(assert (=> start!49020 true))

(declare-fun b!232668 () Bool)

(assert (=> b!232668 (= e!160201 (array_inv!5001 (buf!5801 b1!101)))))

(declare-fun b!232669 () Bool)

(declare-fun res!194714 () Bool)

(assert (=> b!232669 (=> (not res!194714) (not e!160200))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!232669 (= res!194714 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5260 (buf!5801 b1!101))) ((_ sign_extend 32) (currentByte!10808 b1!101)) ((_ sign_extend 32) (currentBit!10803 b1!101)) bytes!19))))

(declare-fun b!232670 () Bool)

(declare-fun res!194715 () Bool)

(assert (=> b!232670 (=> (not res!194715) (not e!160200))))

(assert (=> b!232670 (= res!194715 (= lt!368991 (bvadd (bitIndex!0 (size!5260 (buf!5801 b1!101)) (currentByte!10808 b1!101) (currentBit!10803 b1!101)) bits!86)))))

(assert (= (and start!49020 res!194718) b!232666))

(assert (= (and b!232666 res!194716) b!232669))

(assert (= (and b!232669 res!194714) b!232670))

(assert (= (and b!232670 res!194715) b!232665))

(assert (= (and b!232665 res!194717) b!232667))

(assert (= start!49020 b!232668))

(assert (= start!49020 b!232664))

(declare-fun m!355499 () Bool)

(assert (=> start!49020 m!355499))

(declare-fun m!355501 () Bool)

(assert (=> start!49020 m!355501))

(declare-fun m!355503 () Bool)

(assert (=> b!232666 m!355503))

(declare-fun m!355505 () Bool)

(assert (=> b!232669 m!355505))

(declare-fun m!355507 () Bool)

(assert (=> b!232668 m!355507))

(declare-fun m!355509 () Bool)

(assert (=> b!232665 m!355509))

(declare-fun m!355511 () Bool)

(assert (=> b!232664 m!355511))

(declare-fun m!355513 () Bool)

(assert (=> b!232670 m!355513))

(push 1)

(assert (not b!232669))

(assert (not b!232664))

(assert (not b!232670))

(assert (not b!232665))

(assert (not b!232668))

(assert (not b!232666))

(assert (not start!49020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

