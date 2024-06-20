; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50930 () Bool)

(assert start!50930)

(declare-fun b!238679 () Bool)

(declare-fun e!164877 () Bool)

(declare-fun e!164882 () Bool)

(assert (=> b!238679 (= e!164877 e!164882)))

(declare-fun res!199514 () Bool)

(assert (=> b!238679 (=> (not res!199514) (not e!164882))))

(declare-datatypes ((array!12736 0))(
  ( (array!12737 (arr!6583 (Array (_ BitVec 32) (_ BitVec 8))) (size!5596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10156 0))(
  ( (BitStream!10157 (buf!6071 array!12736) (currentByte!11257 (_ BitVec 32)) (currentBit!11252 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10156)

(declare-fun lt!373381 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238679 (= res!199514 (validate_offset_bits!1 ((_ sign_extend 32) (size!5596 (buf!6071 thiss!1830))) ((_ sign_extend 32) (currentByte!11257 thiss!1830)) ((_ sign_extend 32) (currentBit!11252 thiss!1830)) lt!373381))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238679 (= lt!373381 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238680 () Bool)

(declare-fun e!164880 () Bool)

(assert (=> b!238680 (= e!164882 e!164880)))

(declare-fun res!199515 () Bool)

(assert (=> b!238680 (=> (not res!199515) (not e!164880))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun lt!373383 () (_ BitVec 64))

(assert (=> b!238680 (= res!199515 (and (= (bvand acc!170 lt!373383) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238680 (= lt!373383 (onesLSBLong!0 nBits!581))))

(declare-fun res!199510 () Bool)

(assert (=> start!50930 (=> (not res!199510) (not e!164877))))

(assert (=> start!50930 (= res!199510 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50930 e!164877))

(assert (=> start!50930 true))

(declare-fun e!164878 () Bool)

(declare-fun inv!12 (BitStream!10156) Bool)

(assert (=> start!50930 (and (inv!12 thiss!1830) e!164878)))

(declare-fun b!238681 () Bool)

(declare-fun array_inv!5337 (array!12736) Bool)

(assert (=> b!238681 (= e!164878 (array_inv!5337 (buf!6071 thiss!1830)))))

(declare-fun b!238682 () Bool)

(declare-fun res!199513 () Bool)

(assert (=> b!238682 (=> (not res!199513) (not e!164882))))

(assert (=> b!238682 (= res!199513 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238683 () Bool)

(declare-fun e!164881 () Bool)

(assert (=> b!238683 (= e!164880 e!164881)))

(declare-fun res!199512 () Bool)

(assert (=> b!238683 (=> (not res!199512) (not e!164881))))

(declare-datatypes ((tuple2!20178 0))(
  ( (tuple2!20179 (_1!10993 (_ BitVec 64)) (_2!10993 BitStream!10156)) )
))
(declare-fun lt!373382 () tuple2!20178)

(assert (=> b!238683 (= res!199512 (= (buf!6071 (_2!10993 lt!373382)) (buf!6071 thiss!1830)))))

(declare-datatypes ((tuple2!20180 0))(
  ( (tuple2!20181 (_1!10994 Bool) (_2!10994 BitStream!10156)) )
))
(declare-fun lt!373380 () tuple2!20180)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20178)

(assert (=> b!238683 (= lt!373382 (readNLeastSignificantBitsLoop!0 (_2!10994 lt!373380) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10994 lt!373380) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10156) tuple2!20180)

(assert (=> b!238683 (= lt!373380 (readBit!0 thiss!1830))))

(declare-fun b!238684 () Bool)

(assert (=> b!238684 (= e!164881 (and (= (bvlshr (_1!10993 lt!373382) lt!373381) (bvlshr acc!170 lt!373381)) (= (bvand (_1!10993 lt!373382) lt!373383) (_1!10993 lt!373382)) (bvslt i!752 nBits!581) (let ((bdg!14583 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752)))) (or (bvslt bdg!14583 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!14583 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun b!238685 () Bool)

(declare-fun res!199511 () Bool)

(assert (=> b!238685 (=> (not res!199511) (not e!164881))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238685 (= res!199511 (= (bitIndex!0 (size!5596 (buf!6071 (_2!10993 lt!373382))) (currentByte!11257 (_2!10993 lt!373382)) (currentBit!11252 (_2!10993 lt!373382))) (bvadd (bitIndex!0 (size!5596 (buf!6071 thiss!1830)) (currentByte!11257 thiss!1830) (currentBit!11252 thiss!1830)) lt!373381)))))

(assert (= (and start!50930 res!199510) b!238679))

(assert (= (and b!238679 res!199514) b!238682))

(assert (= (and b!238682 res!199513) b!238680))

(assert (= (and b!238680 res!199515) b!238683))

(assert (= (and b!238683 res!199512) b!238685))

(assert (= (and b!238685 res!199511) b!238684))

(assert (= start!50930 b!238681))

(declare-fun m!360771 () Bool)

(assert (=> b!238679 m!360771))

(declare-fun m!360773 () Bool)

(assert (=> b!238685 m!360773))

(declare-fun m!360775 () Bool)

(assert (=> b!238685 m!360775))

(declare-fun m!360777 () Bool)

(assert (=> b!238680 m!360777))

(declare-fun m!360779 () Bool)

(assert (=> b!238683 m!360779))

(declare-fun m!360781 () Bool)

(assert (=> b!238683 m!360781))

(declare-fun m!360783 () Bool)

(assert (=> b!238682 m!360783))

(declare-fun m!360785 () Bool)

(assert (=> b!238681 m!360785))

(declare-fun m!360787 () Bool)

(assert (=> start!50930 m!360787))

(push 1)

(assert (not b!238683))

(assert (not start!50930))

(assert (not b!238685))

(assert (not b!238679))

(assert (not b!238681))

(assert (not b!238680))

(assert (not b!238682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

