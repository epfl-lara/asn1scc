; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50672 () Bool)

(assert start!50672)

(declare-fun b!236902 () Bool)

(declare-datatypes ((array!12568 0))(
  ( (array!12569 (arr!6502 (Array (_ BitVec 32) (_ BitVec 8))) (size!5515 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9994 0))(
  ( (BitStream!9995 (buf!5990 array!12568) (currentByte!11161 (_ BitVec 32)) (currentBit!11156 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20008 0))(
  ( (tuple2!20009 (_1!10908 (_ BitVec 64)) (_2!10908 BitStream!9994)) )
))
(declare-fun lt!372478 () tuple2!20008)

(declare-fun e!163778 () Bool)

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun lt!372480 () (_ BitVec 64))

(assert (=> b!236902 (= e!163778 (and (= (bvlshr (_1!10908 lt!372478) lt!372480) (bvlshr acc!170 lt!372480)) (bvsgt #b00000000000000000000000000000000 nBits!581)))))

(declare-fun b!236903 () Bool)

(declare-fun e!163780 () Bool)

(declare-fun thiss!1830 () BitStream!9994)

(declare-fun array_inv!5256 (array!12568) Bool)

(assert (=> b!236903 (= e!163780 (array_inv!5256 (buf!5990 thiss!1830)))))

(declare-fun b!236904 () Bool)

(declare-fun e!163779 () Bool)

(declare-fun e!163781 () Bool)

(assert (=> b!236904 (= e!163779 e!163781)))

(declare-fun res!198017 () Bool)

(assert (=> b!236904 (=> (not res!198017) (not e!163781))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236904 (= res!198017 (validate_offset_bits!1 ((_ sign_extend 32) (size!5515 (buf!5990 thiss!1830))) ((_ sign_extend 32) (currentByte!11161 thiss!1830)) ((_ sign_extend 32) (currentBit!11156 thiss!1830)) lt!372480))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236904 (= lt!372480 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!236905 () Bool)

(declare-fun res!198018 () Bool)

(assert (=> b!236905 (=> (not res!198018) (not e!163778))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236905 (= res!198018 (= (bitIndex!0 (size!5515 (buf!5990 (_2!10908 lt!372478))) (currentByte!11161 (_2!10908 lt!372478)) (currentBit!11156 (_2!10908 lt!372478))) (bvadd (bitIndex!0 (size!5515 (buf!5990 thiss!1830)) (currentByte!11161 thiss!1830) (currentBit!11156 thiss!1830)) lt!372480)))))

(declare-fun b!236906 () Bool)

(declare-fun res!198013 () Bool)

(assert (=> b!236906 (=> (not res!198013) (not e!163781))))

(assert (=> b!236906 (= res!198013 (not (= nBits!581 i!752)))))

(declare-fun b!236907 () Bool)

(assert (=> b!236907 (= e!163781 e!163778)))

(declare-fun res!198015 () Bool)

(assert (=> b!236907 (=> (not res!198015) (not e!163778))))

(assert (=> b!236907 (= res!198015 (= (buf!5990 (_2!10908 lt!372478)) (buf!5990 thiss!1830)))))

(declare-datatypes ((tuple2!20010 0))(
  ( (tuple2!20011 (_1!10909 Bool) (_2!10909 BitStream!9994)) )
))
(declare-fun lt!372479 () tuple2!20010)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20008)

(assert (=> b!236907 (= lt!372478 (readNLeastSignificantBitsLoop!0 (_2!10909 lt!372479) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10909 lt!372479) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!9994) tuple2!20010)

(assert (=> b!236907 (= lt!372479 (readBit!0 thiss!1830))))

(declare-fun res!198014 () Bool)

(assert (=> start!50672 (=> (not res!198014) (not e!163779))))

(assert (=> start!50672 (= res!198014 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50672 e!163779))

(assert (=> start!50672 true))

(declare-fun inv!12 (BitStream!9994) Bool)

(assert (=> start!50672 (and (inv!12 thiss!1830) e!163780)))

(declare-fun b!236908 () Bool)

(declare-fun res!198016 () Bool)

(assert (=> b!236908 (=> (not res!198016) (not e!163781))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236908 (= res!198016 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236909 () Bool)

(declare-fun res!198012 () Bool)

(assert (=> b!236909 (=> (not res!198012) (not e!163781))))

(assert (=> b!236909 (= res!198012 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50672 res!198014) b!236904))

(assert (= (and b!236904 res!198017) b!236909))

(assert (= (and b!236909 res!198012) b!236908))

(assert (= (and b!236908 res!198016) b!236906))

(assert (= (and b!236906 res!198013) b!236907))

(assert (= (and b!236907 res!198015) b!236905))

(assert (= (and b!236905 res!198018) b!236902))

(assert (= start!50672 b!236903))

(declare-fun m!359499 () Bool)

(assert (=> b!236904 m!359499))

(declare-fun m!359501 () Bool)

(assert (=> b!236908 m!359501))

(declare-fun m!359503 () Bool)

(assert (=> b!236909 m!359503))

(declare-fun m!359505 () Bool)

(assert (=> b!236907 m!359505))

(declare-fun m!359507 () Bool)

(assert (=> b!236907 m!359507))

(declare-fun m!359509 () Bool)

(assert (=> b!236903 m!359509))

(declare-fun m!359511 () Bool)

(assert (=> b!236905 m!359511))

(declare-fun m!359513 () Bool)

(assert (=> b!236905 m!359513))

(declare-fun m!359515 () Bool)

(assert (=> start!50672 m!359515))

(push 1)

(assert (not b!236904))

(assert (not b!236909))

(assert (not b!236907))

(assert (not b!236905))

(assert (not b!236908))

(assert (not b!236903))

(assert (not start!50672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

