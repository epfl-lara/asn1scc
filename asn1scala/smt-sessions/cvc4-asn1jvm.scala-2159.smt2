; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54828 () Bool)

(assert start!54828)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((array!13871 0))(
  ( (array!13872 (arr!7074 (Array (_ BitVec 32) (_ BitVec 8))) (size!6087 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11096 0))(
  ( (BitStream!11097 (buf!6609 array!13871) (currentByte!12095 (_ BitVec 32)) (currentBit!12090 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11096)

(assert (=> start!54828 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (or (bvsgt ((_ sign_extend 32) (size!6087 (buf!6609 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12095 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12090 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!54828 true))

(declare-fun e!177912 () Bool)

(declare-fun inv!12 (BitStream!11096) Bool)

(assert (=> start!54828 (and (inv!12 thiss!1754) e!177912)))

(declare-fun b!256699 () Bool)

(declare-fun array_inv!5828 (array!13871) Bool)

(assert (=> b!256699 (= e!177912 (array_inv!5828 (buf!6609 thiss!1754)))))

(assert (= start!54828 b!256699))

(declare-fun m!386301 () Bool)

(assert (=> start!54828 m!386301))

(declare-fun m!386303 () Bool)

(assert (=> b!256699 m!386303))

(push 1)

(assert (not b!256699))

(assert (not start!54828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

