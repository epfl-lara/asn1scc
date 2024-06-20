; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25306 () Bool)

(assert start!25306)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5871 0))(
  ( (array!5872 (arr!3272 (Array (_ BitVec 32) (_ BitVec 8))) (size!2655 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5871)

(declare-datatypes ((BitStream!4574 0))(
  ( (BitStream!4575 (buf!3013 array!5871) (currentByte!5758 (_ BitVec 32)) (currentBit!5753 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4574)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25306 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2655 arr!237)) (or (bvsgt ((_ sign_extend 32) (size!2655 (buf!3013 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5758 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5753 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!25306 true))

(declare-fun array_inv!2444 (array!5871) Bool)

(assert (=> start!25306 (array_inv!2444 arr!237)))

(declare-fun e!84748 () Bool)

(declare-fun inv!12 (BitStream!4574) Bool)

(assert (=> start!25306 (and (inv!12 thiss!1634) e!84748)))

(declare-fun b!127892 () Bool)

(assert (=> b!127892 (= e!84748 (array_inv!2444 (buf!3013 thiss!1634)))))

(assert (= start!25306 b!127892))

(declare-fun m!193689 () Bool)

(assert (=> start!25306 m!193689))

(declare-fun m!193691 () Bool)

(assert (=> start!25306 m!193691))

(declare-fun m!193693 () Bool)

(assert (=> b!127892 m!193693))

(push 1)

(assert (not start!25306))

(assert (not b!127892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

