; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53626 () Bool)

(assert start!53626)

(declare-fun res!208439 () Bool)

(declare-fun e!172570 () Bool)

(assert (=> start!53626 (=> (not res!208439) (not e!172570))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53626 (= res!208439 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53626 e!172570))

(assert (=> start!53626 true))

(declare-datatypes ((array!13556 0))(
  ( (array!13557 (arr!6930 (Array (_ BitVec 32) (_ BitVec 8))) (size!5943 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10808 0))(
  ( (BitStream!10809 (buf!6436 array!13556) (currentByte!11861 (_ BitVec 32)) (currentBit!11856 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10808)

(declare-fun e!172571 () Bool)

(declare-fun inv!12 (BitStream!10808) Bool)

(assert (=> start!53626 (and (inv!12 thiss!1005) e!172571)))

(declare-fun b!249069 () Bool)

(declare-fun res!208440 () Bool)

(assert (=> b!249069 (=> (not res!208440) (not e!172570))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249069 (= res!208440 (validate_offset_bits!1 ((_ sign_extend 32) (size!5943 (buf!6436 thiss!1005))) ((_ sign_extend 32) (currentByte!11861 thiss!1005)) ((_ sign_extend 32) (currentBit!11856 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249070 () Bool)

(assert (=> b!249070 (= e!172570 (and (not (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!249071 () Bool)

(declare-fun array_inv!5684 (array!13556) Bool)

(assert (=> b!249071 (= e!172571 (array_inv!5684 (buf!6436 thiss!1005)))))

(assert (= (and start!53626 res!208439) b!249069))

(assert (= (and b!249069 res!208440) b!249070))

(assert (= start!53626 b!249071))

(declare-fun m!375543 () Bool)

(assert (=> start!53626 m!375543))

(declare-fun m!375545 () Bool)

(assert (=> b!249069 m!375545))

(declare-fun m!375547 () Bool)

(assert (=> b!249071 m!375547))

(push 1)

(assert (not b!249071))

(assert (not b!249069))

(assert (not start!53626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

