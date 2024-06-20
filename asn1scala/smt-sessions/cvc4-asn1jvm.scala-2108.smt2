; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53614 () Bool)

(assert start!53614)

(declare-fun b!249043 () Bool)

(declare-fun e!172544 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!249043 (= e!172544 (not (= nBits!297 from!289)))))

(declare-datatypes ((array!13550 0))(
  ( (array!13551 (arr!6927 (Array (_ BitVec 32) (_ BitVec 8))) (size!5940 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10802 0))(
  ( (BitStream!10803 (buf!6433 array!13550) (currentByte!11858 (_ BitVec 32)) (currentBit!11853 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10802)

(declare-fun isPrefixOf!0 (BitStream!10802 BitStream!10802) Bool)

(assert (=> b!249043 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!18028 0))(
  ( (Unit!18029) )
))
(declare-fun lt!388044 () Unit!18028)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10802) Unit!18028)

(assert (=> b!249043 (= lt!388044 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!208421 () Bool)

(assert (=> start!53614 (=> (not res!208421) (not e!172544))))

(assert (=> start!53614 (= res!208421 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53614 e!172544))

(assert (=> start!53614 true))

(declare-fun e!172543 () Bool)

(declare-fun inv!12 (BitStream!10802) Bool)

(assert (=> start!53614 (and (inv!12 thiss!1005) e!172543)))

(declare-fun b!249044 () Bool)

(declare-fun array_inv!5681 (array!13550) Bool)

(assert (=> b!249044 (= e!172543 (array_inv!5681 (buf!6433 thiss!1005)))))

(declare-fun b!249042 () Bool)

(declare-fun res!208422 () Bool)

(assert (=> b!249042 (=> (not res!208422) (not e!172544))))

(assert (=> b!249042 (= res!208422 (bvsge from!289 nBits!297))))

(declare-fun b!249041 () Bool)

(declare-fun res!208420 () Bool)

(assert (=> b!249041 (=> (not res!208420) (not e!172544))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249041 (= res!208420 (validate_offset_bits!1 ((_ sign_extend 32) (size!5940 (buf!6433 thiss!1005))) ((_ sign_extend 32) (currentByte!11858 thiss!1005)) ((_ sign_extend 32) (currentBit!11853 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53614 res!208421) b!249041))

(assert (= (and b!249041 res!208420) b!249042))

(assert (= (and b!249042 res!208422) b!249043))

(assert (= start!53614 b!249044))

(declare-fun m!375521 () Bool)

(assert (=> b!249043 m!375521))

(declare-fun m!375523 () Bool)

(assert (=> b!249043 m!375523))

(declare-fun m!375525 () Bool)

(assert (=> start!53614 m!375525))

(declare-fun m!375527 () Bool)

(assert (=> b!249044 m!375527))

(declare-fun m!375529 () Bool)

(assert (=> b!249041 m!375529))

(push 1)

(assert (not start!53614))

(assert (not b!249043))

(assert (not b!249044))

(assert (not b!249041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

