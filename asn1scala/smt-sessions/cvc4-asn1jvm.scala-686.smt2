; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19356 () Bool)

(assert start!19356)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4504 0))(
  ( (array!4505 (arr!2654 (Array (_ BitVec 32) (_ BitVec 8))) (size!2061 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3596 0))(
  ( (BitStream!3597 (buf!2407 array!4504) (currentByte!4810 (_ BitVec 32)) (currentBit!4805 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3596)

(assert (=> start!19356 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!2061 (buf!2407 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4810 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4805 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!19356 true))

(declare-fun e!63431 () Bool)

(declare-fun inv!12 (BitStream!3596) Bool)

(assert (=> start!19356 (and (inv!12 thiss!1288) e!63431)))

(declare-fun b!96825 () Bool)

(declare-fun array_inv!1863 (array!4504) Bool)

(assert (=> b!96825 (= e!63431 (array_inv!1863 (buf!2407 thiss!1288)))))

(assert (= start!19356 b!96825))

(declare-fun m!140469 () Bool)

(assert (=> start!19356 m!140469))

(declare-fun m!140471 () Bool)

(assert (=> b!96825 m!140471))

(push 1)

