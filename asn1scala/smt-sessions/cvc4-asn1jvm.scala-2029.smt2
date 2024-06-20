; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51850 () Bool)

(assert start!51850)

(declare-datatypes ((array!13021 0))(
  ( (array!13022 (arr!6693 (Array (_ BitVec 32) (_ BitVec 8))) (size!5706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10334 0))(
  ( (BitStream!10335 (buf!6160 array!13021) (currentByte!11472 (_ BitVec 32)) (currentBit!11467 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10334)

(assert (=> start!51850 (not (= (bvand (currentByte!11472 thiss!1948) #b00000000000000000000000000000011) (bvsdiv (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11472 thiss!1948) #b00000000000000000000000000000011)) #b00000000000000000000000000001000)))))

(declare-fun e!165970 () Bool)

(declare-fun inv!12 (BitStream!10334) Bool)

(assert (=> start!51850 (and (inv!12 thiss!1948) e!165970)))

(declare-fun b!239585 () Bool)

(declare-fun array_inv!5447 (array!13021) Bool)

(assert (=> b!239585 (= e!165970 (array_inv!5447 (buf!6160 thiss!1948)))))

(assert (= start!51850 b!239585))

(declare-fun m!361827 () Bool)

(assert (=> start!51850 m!361827))

(declare-fun m!361829 () Bool)

(assert (=> b!239585 m!361829))

(push 1)

(assert (not b!239585))

(assert (not start!51850))

(check-sat)

(pop 1)

