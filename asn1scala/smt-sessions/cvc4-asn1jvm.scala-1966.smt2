; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50922 () Bool)

(assert start!50922)

(declare-fun b!238596 () Bool)

(declare-fun res!199442 () Bool)

(declare-fun e!164806 () Bool)

(assert (=> b!238596 (=> (not res!199442) (not e!164806))))

(declare-datatypes ((array!12728 0))(
  ( (array!12729 (arr!6579 (Array (_ BitVec 32) (_ BitVec 8))) (size!5592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10148 0))(
  ( (BitStream!10149 (buf!6067 array!12728) (currentByte!11253 (_ BitVec 32)) (currentBit!11248 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10148)

(declare-fun lt!373333 () (_ BitVec 64))

(declare-datatypes ((tuple2!20162 0))(
  ( (tuple2!20163 (_1!10985 (_ BitVec 64)) (_2!10985 BitStream!10148)) )
))
(declare-fun lt!373334 () tuple2!20162)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238596 (= res!199442 (= (bitIndex!0 (size!5592 (buf!6067 (_2!10985 lt!373334))) (currentByte!11253 (_2!10985 lt!373334)) (currentBit!11248 (_2!10985 lt!373334))) (bvadd (bitIndex!0 (size!5592 (buf!6067 thiss!1830)) (currentByte!11253 thiss!1830) (currentBit!11248 thiss!1830)) lt!373333)))))

(declare-fun b!238597 () Bool)

(declare-fun res!199440 () Bool)

(declare-fun e!164807 () Bool)

(assert (=> b!238597 (=> (not res!199440) (not e!164807))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238597 (= res!199440 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238598 () Bool)

(declare-fun e!164805 () Bool)

(declare-fun array_inv!5333 (array!12728) Bool)

(assert (=> b!238598 (= e!164805 (array_inv!5333 (buf!6067 thiss!1830)))))

(declare-fun b!238599 () Bool)

(declare-fun e!164808 () Bool)

(assert (=> b!238599 (= e!164808 e!164807)))

(declare-fun res!199439 () Bool)

(assert (=> b!238599 (=> (not res!199439) (not e!164807))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238599 (= res!199439 (validate_offset_bits!1 ((_ sign_extend 32) (size!5592 (buf!6067 thiss!1830))) ((_ sign_extend 32) (currentByte!11253 thiss!1830)) ((_ sign_extend 32) (currentBit!11248 thiss!1830)) lt!373333))))

(assert (=> b!238599 (= lt!373333 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238600 () Bool)

(declare-fun e!164810 () Bool)

(assert (=> b!238600 (= e!164810 e!164806)))

(declare-fun res!199438 () Bool)

(assert (=> b!238600 (=> (not res!199438) (not e!164806))))

(assert (=> b!238600 (= res!199438 (= (buf!6067 (_2!10985 lt!373334)) (buf!6067 thiss!1830)))))

(declare-datatypes ((tuple2!20164 0))(
  ( (tuple2!20165 (_1!10986 Bool) (_2!10986 BitStream!10148)) )
))
(declare-fun lt!373335 () tuple2!20164)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20162)

(assert (=> b!238600 (= lt!373334 (readNLeastSignificantBitsLoop!0 (_2!10986 lt!373335) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10986 lt!373335) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10148) tuple2!20164)

(assert (=> b!238600 (= lt!373335 (readBit!0 thiss!1830))))

(declare-fun b!238601 () Bool)

(assert (=> b!238601 (= e!164807 e!164810)))

(declare-fun res!199441 () Bool)

(assert (=> b!238601 (=> (not res!199441) (not e!164810))))

(declare-fun lt!373332 () (_ BitVec 64))

(assert (=> b!238601 (= res!199441 (and (= (bvand acc!170 lt!373332) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!238601 (= lt!373332 (onesLSBLong!0 nBits!581))))

(declare-fun b!238595 () Bool)

(assert (=> b!238595 (= e!164806 (and (= (bvlshr (_1!10985 lt!373334) lt!373333) (bvlshr acc!170 lt!373333)) (= (bvand (_1!10985 lt!373334) lt!373332) (_1!10985 lt!373334)) (bvslt i!752 nBits!581) (not (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun res!199443 () Bool)

(assert (=> start!50922 (=> (not res!199443) (not e!164808))))

(assert (=> start!50922 (= res!199443 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50922 e!164808))

(assert (=> start!50922 true))

(declare-fun inv!12 (BitStream!10148) Bool)

(assert (=> start!50922 (and (inv!12 thiss!1830) e!164805)))

(assert (= (and start!50922 res!199443) b!238599))

(assert (= (and b!238599 res!199439) b!238597))

(assert (= (and b!238597 res!199440) b!238601))

(assert (= (and b!238601 res!199441) b!238600))

(assert (= (and b!238600 res!199438) b!238596))

(assert (= (and b!238596 res!199442) b!238595))

(assert (= start!50922 b!238598))

(declare-fun m!360699 () Bool)

(assert (=> b!238598 m!360699))

(declare-fun m!360701 () Bool)

(assert (=> b!238601 m!360701))

(declare-fun m!360703 () Bool)

(assert (=> start!50922 m!360703))

(declare-fun m!360705 () Bool)

(assert (=> b!238596 m!360705))

(declare-fun m!360707 () Bool)

(assert (=> b!238596 m!360707))

(declare-fun m!360709 () Bool)

(assert (=> b!238597 m!360709))

(declare-fun m!360711 () Bool)

(assert (=> b!238600 m!360711))

(declare-fun m!360713 () Bool)

(assert (=> b!238600 m!360713))

(declare-fun m!360715 () Bool)

(assert (=> b!238599 m!360715))

(push 1)

(assert (not b!238601))

(assert (not b!238597))

(assert (not b!238600))

(assert (not b!238599))

(assert (not start!50922))

(assert (not b!238598))

(assert (not b!238596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

