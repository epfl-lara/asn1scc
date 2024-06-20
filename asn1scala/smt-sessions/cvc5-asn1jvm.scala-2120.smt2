; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53706 () Bool)

(assert start!53706)

(declare-fun res!208991 () Bool)

(declare-fun e!173051 () Bool)

(assert (=> start!53706 (=> (not res!208991) (not e!173051))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53706 (= res!208991 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53706 e!173051))

(assert (=> start!53706 true))

(declare-datatypes ((array!13615 0))(
  ( (array!13616 (arr!6958 (Array (_ BitVec 32) (_ BitVec 8))) (size!5971 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10864 0))(
  ( (BitStream!10865 (buf!6464 array!13615) (currentByte!11895 (_ BitVec 32)) (currentBit!11890 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10864)

(declare-fun e!173049 () Bool)

(declare-fun inv!12 (BitStream!10864) Bool)

(assert (=> start!53706 (and (inv!12 thiss!1005) e!173049)))

(declare-fun b!249702 () Bool)

(declare-fun array_inv!5712 (array!13615) Bool)

(assert (=> b!249702 (= e!173049 (array_inv!5712 (buf!6464 thiss!1005)))))

(declare-fun b!249703 () Bool)

(declare-fun res!208989 () Bool)

(assert (=> b!249703 (=> (not res!208989) (not e!173051))))

(assert (=> b!249703 (= res!208989 (bvslt from!289 nBits!297))))

(declare-fun b!249704 () Bool)

(declare-fun res!208990 () Bool)

(declare-fun e!173047 () Bool)

(assert (=> b!249704 (=> (not res!208990) (not e!173047))))

(declare-datatypes ((Unit!18078 0))(
  ( (Unit!18079) )
))
(declare-datatypes ((tuple2!21390 0))(
  ( (tuple2!21391 (_1!11620 Unit!18078) (_2!11620 BitStream!10864)) )
))
(declare-fun lt!388374 () tuple2!21390)

(declare-fun isPrefixOf!0 (BitStream!10864 BitStream!10864) Bool)

(assert (=> b!249704 (= res!208990 (isPrefixOf!0 thiss!1005 (_2!11620 lt!388374)))))

(declare-fun b!249705 () Bool)

(declare-fun res!208994 () Bool)

(assert (=> b!249705 (=> (not res!208994) (not e!173051))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249705 (= res!208994 (validate_offset_bits!1 ((_ sign_extend 32) (size!5971 (buf!6464 thiss!1005))) ((_ sign_extend 32) (currentByte!11895 thiss!1005)) ((_ sign_extend 32) (currentBit!11890 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249706 () Bool)

(declare-fun e!173050 () Bool)

(assert (=> b!249706 (= e!173050 e!173047)))

(declare-fun res!208995 () Bool)

(assert (=> b!249706 (=> (not res!208995) (not e!173047))))

(declare-fun lt!388371 () (_ BitVec 64))

(declare-fun lt!388372 () (_ BitVec 64))

(assert (=> b!249706 (= res!208995 (= lt!388371 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388372)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249706 (= lt!388371 (bitIndex!0 (size!5971 (buf!6464 (_2!11620 lt!388374))) (currentByte!11895 (_2!11620 lt!388374)) (currentBit!11890 (_2!11620 lt!388374))))))

(assert (=> b!249706 (= lt!388372 (bitIndex!0 (size!5971 (buf!6464 thiss!1005)) (currentByte!11895 thiss!1005) (currentBit!11890 thiss!1005)))))

(declare-fun b!249707 () Bool)

(declare-fun e!173046 () Bool)

(assert (=> b!249707 (= e!173047 e!173046)))

(declare-fun res!208992 () Bool)

(assert (=> b!249707 (=> (not res!208992) (not e!173046))))

(declare-datatypes ((tuple2!21392 0))(
  ( (tuple2!21393 (_1!11621 BitStream!10864) (_2!11621 Bool)) )
))
(declare-fun lt!388373 () tuple2!21392)

(declare-fun bit!26 () Bool)

(assert (=> b!249707 (= res!208992 (and (= (_2!11621 lt!388373) bit!26) (= (_1!11621 lt!388373) (_2!11620 lt!388374))))))

(declare-fun readBitPure!0 (BitStream!10864) tuple2!21392)

(declare-fun readerFrom!0 (BitStream!10864 (_ BitVec 32) (_ BitVec 32)) BitStream!10864)

(assert (=> b!249707 (= lt!388373 (readBitPure!0 (readerFrom!0 (_2!11620 lt!388374) (currentBit!11890 thiss!1005) (currentByte!11895 thiss!1005))))))

(declare-fun b!249708 () Bool)

(assert (=> b!249708 (= e!173046 (= (bitIndex!0 (size!5971 (buf!6464 (_1!11621 lt!388373))) (currentByte!11895 (_1!11621 lt!388373)) (currentBit!11890 (_1!11621 lt!388373))) lt!388371))))

(declare-fun b!249709 () Bool)

(declare-fun e!173048 () Bool)

(assert (=> b!249709 (= e!173051 (not e!173048))))

(declare-fun res!208988 () Bool)

(assert (=> b!249709 (=> res!208988 e!173048)))

(assert (=> b!249709 (= res!208988 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249709 (validate_offset_bits!1 ((_ sign_extend 32) (size!5971 (buf!6464 (_2!11620 lt!388374)))) ((_ sign_extend 32) (currentByte!11895 (_2!11620 lt!388374))) ((_ sign_extend 32) (currentBit!11890 (_2!11620 lt!388374))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388370 () Unit!18078)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10864 BitStream!10864 (_ BitVec 64) (_ BitVec 64)) Unit!18078)

(assert (=> b!249709 (= lt!388370 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11620 lt!388374) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249709 e!173050))

(declare-fun res!208993 () Bool)

(assert (=> b!249709 (=> (not res!208993) (not e!173050))))

(assert (=> b!249709 (= res!208993 (= (size!5971 (buf!6464 thiss!1005)) (size!5971 (buf!6464 (_2!11620 lt!388374)))))))

(declare-fun appendBit!0 (BitStream!10864 Bool) tuple2!21390)

(assert (=> b!249709 (= lt!388374 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249710 () Bool)

(assert (=> b!249710 (= e!173048 (validate_offset_bits!1 ((_ sign_extend 32) (size!5971 (buf!6464 (_2!11620 lt!388374)))) ((_ sign_extend 32) (currentByte!11895 (_2!11620 lt!388374))) ((_ sign_extend 32) (currentBit!11890 (_2!11620 lt!388374))) (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(assert (= (and start!53706 res!208991) b!249705))

(assert (= (and b!249705 res!208994) b!249703))

(assert (= (and b!249703 res!208989) b!249709))

(assert (= (and b!249709 res!208993) b!249706))

(assert (= (and b!249706 res!208995) b!249704))

(assert (= (and b!249704 res!208990) b!249707))

(assert (= (and b!249707 res!208992) b!249708))

(assert (= (and b!249709 (not res!208988)) b!249710))

(assert (= start!53706 b!249702))

(declare-fun m!376101 () Bool)

(assert (=> b!249707 m!376101))

(assert (=> b!249707 m!376101))

(declare-fun m!376103 () Bool)

(assert (=> b!249707 m!376103))

(declare-fun m!376105 () Bool)

(assert (=> b!249705 m!376105))

(declare-fun m!376107 () Bool)

(assert (=> b!249708 m!376107))

(declare-fun m!376109 () Bool)

(assert (=> b!249702 m!376109))

(declare-fun m!376111 () Bool)

(assert (=> b!249704 m!376111))

(declare-fun m!376113 () Bool)

(assert (=> b!249706 m!376113))

(declare-fun m!376115 () Bool)

(assert (=> b!249706 m!376115))

(declare-fun m!376117 () Bool)

(assert (=> b!249710 m!376117))

(declare-fun m!376119 () Bool)

(assert (=> start!53706 m!376119))

(declare-fun m!376121 () Bool)

(assert (=> b!249709 m!376121))

(declare-fun m!376123 () Bool)

(assert (=> b!249709 m!376123))

(declare-fun m!376125 () Bool)

(assert (=> b!249709 m!376125))

(push 1)

(assert (not b!249708))

(assert (not b!249706))

(assert (not b!249707))

(assert (not b!249702))

(assert (not b!249705))

(assert (not start!53706))

(assert (not b!249710))

(assert (not b!249709))

(assert (not b!249704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

