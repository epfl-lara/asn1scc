; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53688 () Bool)

(assert start!53688)

(declare-fun b!249484 () Bool)

(declare-fun e!172884 () Bool)

(declare-datatypes ((array!13597 0))(
  ( (array!13598 (arr!6949 (Array (_ BitVec 32) (_ BitVec 8))) (size!5962 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10846 0))(
  ( (BitStream!10847 (buf!6455 array!13597) (currentByte!11886 (_ BitVec 32)) (currentBit!11881 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21354 0))(
  ( (tuple2!21355 (_1!11602 BitStream!10846) (_2!11602 Bool)) )
))
(declare-fun lt!388235 () tuple2!21354)

(declare-fun lt!388238 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249484 (= e!172884 (= (bitIndex!0 (size!5962 (buf!6455 (_1!11602 lt!388235))) (currentByte!11886 (_1!11602 lt!388235)) (currentBit!11881 (_1!11602 lt!388235))) lt!388238))))

(declare-fun b!249485 () Bool)

(declare-fun e!172885 () Bool)

(declare-fun e!172881 () Bool)

(assert (=> b!249485 (= e!172885 e!172881)))

(declare-fun res!208803 () Bool)

(assert (=> b!249485 (=> (not res!208803) (not e!172881))))

(declare-fun lt!388239 () (_ BitVec 64))

(assert (=> b!249485 (= res!208803 (= lt!388238 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388239)))))

(declare-datatypes ((Unit!18060 0))(
  ( (Unit!18061) )
))
(declare-datatypes ((tuple2!21356 0))(
  ( (tuple2!21357 (_1!11603 Unit!18060) (_2!11603 BitStream!10846)) )
))
(declare-fun lt!388237 () tuple2!21356)

(assert (=> b!249485 (= lt!388238 (bitIndex!0 (size!5962 (buf!6455 (_2!11603 lt!388237))) (currentByte!11886 (_2!11603 lt!388237)) (currentBit!11881 (_2!11603 lt!388237))))))

(declare-fun thiss!1005 () BitStream!10846)

(assert (=> b!249485 (= lt!388239 (bitIndex!0 (size!5962 (buf!6455 thiss!1005)) (currentByte!11886 thiss!1005) (currentBit!11881 thiss!1005)))))

(declare-fun b!249486 () Bool)

(declare-fun res!208798 () Bool)

(declare-fun e!172886 () Bool)

(assert (=> b!249486 (=> (not res!208798) (not e!172886))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249486 (= res!208798 (bvslt from!289 nBits!297))))

(declare-fun b!249487 () Bool)

(declare-fun res!208797 () Bool)

(assert (=> b!249487 (=> (not res!208797) (not e!172881))))

(declare-fun isPrefixOf!0 (BitStream!10846 BitStream!10846) Bool)

(assert (=> b!249487 (= res!208797 (isPrefixOf!0 thiss!1005 (_2!11603 lt!388237)))))

(declare-fun res!208802 () Bool)

(assert (=> start!53688 (=> (not res!208802) (not e!172886))))

(assert (=> start!53688 (= res!208802 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53688 e!172886))

(assert (=> start!53688 true))

(declare-fun e!172883 () Bool)

(declare-fun inv!12 (BitStream!10846) Bool)

(assert (=> start!53688 (and (inv!12 thiss!1005) e!172883)))

(declare-fun b!249488 () Bool)

(declare-fun res!208800 () Bool)

(assert (=> b!249488 (=> (not res!208800) (not e!172886))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249488 (= res!208800 (validate_offset_bits!1 ((_ sign_extend 32) (size!5962 (buf!6455 thiss!1005))) ((_ sign_extend 32) (currentByte!11886 thiss!1005)) ((_ sign_extend 32) (currentBit!11881 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249489 () Bool)

(assert (=> b!249489 (= e!172881 e!172884)))

(declare-fun res!208801 () Bool)

(assert (=> b!249489 (=> (not res!208801) (not e!172884))))

(declare-fun bit!26 () Bool)

(assert (=> b!249489 (= res!208801 (and (= (_2!11602 lt!388235) bit!26) (= (_1!11602 lt!388235) (_2!11603 lt!388237))))))

(declare-fun readBitPure!0 (BitStream!10846) tuple2!21354)

(declare-fun readerFrom!0 (BitStream!10846 (_ BitVec 32) (_ BitVec 32)) BitStream!10846)

(assert (=> b!249489 (= lt!388235 (readBitPure!0 (readerFrom!0 (_2!11603 lt!388237) (currentBit!11881 thiss!1005) (currentByte!11886 thiss!1005))))))

(declare-fun b!249490 () Bool)

(declare-fun array_inv!5703 (array!13597) Bool)

(assert (=> b!249490 (= e!172883 (array_inv!5703 (buf!6455 thiss!1005)))))

(declare-fun b!249491 () Bool)

(assert (=> b!249491 (= e!172886 (not (or (not (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!249491 (validate_offset_bits!1 ((_ sign_extend 32) (size!5962 (buf!6455 (_2!11603 lt!388237)))) ((_ sign_extend 32) (currentByte!11886 (_2!11603 lt!388237))) ((_ sign_extend 32) (currentBit!11881 (_2!11603 lt!388237))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388236 () Unit!18060)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10846 BitStream!10846 (_ BitVec 64) (_ BitVec 64)) Unit!18060)

(assert (=> b!249491 (= lt!388236 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11603 lt!388237) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249491 e!172885))

(declare-fun res!208799 () Bool)

(assert (=> b!249491 (=> (not res!208799) (not e!172885))))

(assert (=> b!249491 (= res!208799 (= (size!5962 (buf!6455 thiss!1005)) (size!5962 (buf!6455 (_2!11603 lt!388237)))))))

(declare-fun appendBit!0 (BitStream!10846 Bool) tuple2!21356)

(assert (=> b!249491 (= lt!388237 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!53688 res!208802) b!249488))

(assert (= (and b!249488 res!208800) b!249486))

(assert (= (and b!249486 res!208798) b!249491))

(assert (= (and b!249491 res!208799) b!249485))

(assert (= (and b!249485 res!208803) b!249487))

(assert (= (and b!249487 res!208797) b!249489))

(assert (= (and b!249489 res!208801) b!249484))

(assert (= start!53688 b!249490))

(declare-fun m!375885 () Bool)

(assert (=> b!249484 m!375885))

(declare-fun m!375887 () Bool)

(assert (=> b!249491 m!375887))

(declare-fun m!375889 () Bool)

(assert (=> b!249491 m!375889))

(declare-fun m!375891 () Bool)

(assert (=> b!249491 m!375891))

(declare-fun m!375893 () Bool)

(assert (=> start!53688 m!375893))

(declare-fun m!375895 () Bool)

(assert (=> b!249488 m!375895))

(declare-fun m!375897 () Bool)

(assert (=> b!249489 m!375897))

(assert (=> b!249489 m!375897))

(declare-fun m!375899 () Bool)

(assert (=> b!249489 m!375899))

(declare-fun m!375901 () Bool)

(assert (=> b!249485 m!375901))

(declare-fun m!375903 () Bool)

(assert (=> b!249485 m!375903))

(declare-fun m!375905 () Bool)

(assert (=> b!249487 m!375905))

(declare-fun m!375907 () Bool)

(assert (=> b!249490 m!375907))

(push 1)

(assert (not b!249487))

(assert (not start!53688))

(assert (not b!249491))

(assert (not b!249490))

(assert (not b!249485))

(assert (not b!249484))

(assert (not b!249488))

(assert (not b!249489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

