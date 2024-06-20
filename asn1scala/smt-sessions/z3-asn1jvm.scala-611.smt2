; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17416 () Bool)

(assert start!17416)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3953 0))(
  ( (array!3954 (arr!2428 (Array (_ BitVec 32) (_ BitVec 8))) (size!1791 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3144 0))(
  ( (BitStream!3145 (buf!2181 array!3953) (currentByte!4336 (_ BitVec 32)) (currentBit!4331 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3144)

(assert (=> start!17416 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!1791 (buf!2181 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4336 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4331 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!17416 true))

(declare-fun e!56177 () Bool)

(declare-fun inv!12 (BitStream!3144) Bool)

(assert (=> start!17416 (and (inv!12 thiss!1136) e!56177)))

(declare-fun b!84082 () Bool)

(declare-fun array_inv!1637 (array!3953) Bool)

(assert (=> b!84082 (= e!56177 (array_inv!1637 (buf!2181 thiss!1136)))))

(assert (= start!17416 b!84082))

(declare-fun m!130783 () Bool)

(assert (=> start!17416 m!130783))

(declare-fun m!130785 () Bool)

(assert (=> b!84082 m!130785))

(check-sat (not start!17416) (not b!84082))
(check-sat)
