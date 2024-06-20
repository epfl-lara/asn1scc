; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53134 () Bool)

(assert start!53134)

(declare-fun b!246921 () Bool)

(declare-fun res!206612 () Bool)

(declare-fun e!171075 () Bool)

(assert (=> b!246921 (=> (not res!206612) (not e!171075))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13462 0))(
  ( (array!13463 (arr!6890 (Array (_ BitVec 32) (_ BitVec 8))) (size!5903 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10728 0))(
  ( (BitStream!10729 (buf!6384 array!13462) (currentByte!11780 (_ BitVec 32)) (currentBit!11775 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10728)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246921 (= res!206612 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 thiss!1005))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun e!171069 () Bool)

(declare-fun b!246922 () Bool)

(declare-datatypes ((tuple2!21198 0))(
  ( (tuple2!21199 (_1!11521 BitStream!10728) (_2!11521 BitStream!10728)) )
))
(declare-fun lt!385120 () tuple2!21198)

(assert (=> b!246922 (= e!171069 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11521 lt!385120)))) ((_ sign_extend 32) (currentByte!11780 (_1!11521 lt!385120))) ((_ sign_extend 32) (currentBit!11775 (_1!11521 lt!385120))) (bvsub nBits!297 from!289)))))

(declare-fun b!246923 () Bool)

(declare-fun e!171076 () Bool)

(declare-fun e!171067 () Bool)

(assert (=> b!246923 (= e!171076 e!171067)))

(declare-fun res!206614 () Bool)

(assert (=> b!246923 (=> (not res!206614) (not e!171067))))

(declare-datatypes ((Unit!17918 0))(
  ( (Unit!17919) )
))
(declare-datatypes ((tuple2!21200 0))(
  ( (tuple2!21201 (_1!11522 Unit!17918) (_2!11522 BitStream!10728)) )
))
(declare-fun lt!385109 () tuple2!21200)

(declare-datatypes ((tuple2!21202 0))(
  ( (tuple2!21203 (_1!11523 BitStream!10728) (_2!11523 Bool)) )
))
(declare-fun lt!385122 () tuple2!21202)

(declare-fun bit!26 () Bool)

(assert (=> b!246923 (= res!206614 (and (= (_2!11523 lt!385122) bit!26) (= (_1!11523 lt!385122) (_2!11522 lt!385109))))))

(declare-fun readBitPure!0 (BitStream!10728) tuple2!21202)

(declare-fun readerFrom!0 (BitStream!10728 (_ BitVec 32) (_ BitVec 32)) BitStream!10728)

(assert (=> b!246923 (= lt!385122 (readBitPure!0 (readerFrom!0 (_2!11522 lt!385109) (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005))))))

(declare-fun b!246924 () Bool)

(declare-fun e!171070 () Bool)

(assert (=> b!246924 (= e!171075 (not e!171070))))

(declare-fun res!206615 () Bool)

(assert (=> b!246924 (=> res!206615 e!171070)))

(declare-fun lt!385113 () tuple2!21202)

(declare-fun lt!385112 () tuple2!21198)

(assert (=> b!246924 (= res!206615 (not (= (_1!11523 lt!385113) (_2!11521 lt!385112))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10728 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21202)

(assert (=> b!246924 (= lt!385113 (checkBitsLoopPure!0 (_1!11521 lt!385112) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385103 () tuple2!21200)

(declare-fun lt!385111 () (_ BitVec 64))

(assert (=> b!246924 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385111)))

(declare-fun lt!385101 () Unit!17918)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10728 array!13462 (_ BitVec 64)) Unit!17918)

(assert (=> b!246924 (= lt!385101 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11522 lt!385109) (buf!6384 (_2!11522 lt!385103)) lt!385111))))

(declare-fun lt!385117 () tuple2!21202)

(assert (=> b!246924 (= lt!385117 (checkBitsLoopPure!0 (_1!11521 lt!385120) nBits!297 bit!26 from!289))))

(assert (=> b!246924 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!385104 () Unit!17918)

(assert (=> b!246924 (= lt!385104 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6384 (_2!11522 lt!385103)) (bvsub nBits!297 from!289)))))

(assert (=> b!246924 (= (_2!11523 (readBitPure!0 (_1!11521 lt!385120))) bit!26)))

(declare-fun reader!0 (BitStream!10728 BitStream!10728) tuple2!21198)

(assert (=> b!246924 (= lt!385112 (reader!0 (_2!11522 lt!385109) (_2!11522 lt!385103)))))

(assert (=> b!246924 (= lt!385120 (reader!0 thiss!1005 (_2!11522 lt!385103)))))

(declare-fun e!171077 () Bool)

(assert (=> b!246924 e!171077))

(declare-fun res!206625 () Bool)

(assert (=> b!246924 (=> (not res!206625) (not e!171077))))

(declare-fun lt!385108 () tuple2!21202)

(declare-fun lt!385105 () tuple2!21202)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246924 (= res!206625 (= (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385108))) (currentByte!11780 (_1!11523 lt!385108)) (currentBit!11775 (_1!11523 lt!385108))) (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385105))) (currentByte!11780 (_1!11523 lt!385105)) (currentBit!11775 (_1!11523 lt!385105)))))))

(declare-fun lt!385114 () Unit!17918)

(declare-fun lt!385115 () BitStream!10728)

(declare-fun readBitPrefixLemma!0 (BitStream!10728 BitStream!10728) Unit!17918)

(assert (=> b!246924 (= lt!385114 (readBitPrefixLemma!0 lt!385115 (_2!11522 lt!385103)))))

(assert (=> b!246924 (= lt!385105 (readBitPure!0 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005))))))

(assert (=> b!246924 (= lt!385108 (readBitPure!0 lt!385115))))

(assert (=> b!246924 (= lt!385115 (BitStream!10729 (buf!6384 (_2!11522 lt!385109)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)))))

(declare-fun e!171066 () Bool)

(assert (=> b!246924 e!171066))

(declare-fun res!206620 () Bool)

(assert (=> b!246924 (=> (not res!206620) (not e!171066))))

(declare-fun isPrefixOf!0 (BitStream!10728 BitStream!10728) Bool)

(assert (=> b!246924 (= res!206620 (isPrefixOf!0 thiss!1005 (_2!11522 lt!385103)))))

(declare-fun lt!385119 () Unit!17918)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10728 BitStream!10728 BitStream!10728) Unit!17918)

(assert (=> b!246924 (= lt!385119 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11522 lt!385109) (_2!11522 lt!385103)))))

(declare-fun e!171074 () Bool)

(assert (=> b!246924 e!171074))

(declare-fun res!206611 () Bool)

(assert (=> b!246924 (=> (not res!206611) (not e!171074))))

(assert (=> b!246924 (= res!206611 (= (size!5903 (buf!6384 (_2!11522 lt!385109))) (size!5903 (buf!6384 (_2!11522 lt!385103)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10728 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21200)

(assert (=> b!246924 (= lt!385103 (appendNBitsLoop!0 (_2!11522 lt!385109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246924 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385111)))

(assert (=> b!246924 (= lt!385111 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!385107 () Unit!17918)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10728 BitStream!10728 (_ BitVec 64) (_ BitVec 64)) Unit!17918)

(assert (=> b!246924 (= lt!385107 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11522 lt!385109) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!171068 () Bool)

(assert (=> b!246924 e!171068))

(declare-fun res!206618 () Bool)

(assert (=> b!246924 (=> (not res!206618) (not e!171068))))

(assert (=> b!246924 (= res!206618 (= (size!5903 (buf!6384 thiss!1005)) (size!5903 (buf!6384 (_2!11522 lt!385109)))))))

(declare-fun appendBit!0 (BitStream!10728 Bool) tuple2!21200)

(assert (=> b!246924 (= lt!385109 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246925 () Bool)

(declare-fun e!171072 () Bool)

(declare-fun lt!385106 () tuple2!21202)

(declare-fun lt!385110 () tuple2!21198)

(assert (=> b!246925 (= e!171072 (not (or (not (_2!11523 lt!385106)) (not (= (_1!11523 lt!385106) (_2!11521 lt!385110))))))))

(assert (=> b!246925 (= lt!385106 (checkBitsLoopPure!0 (_1!11521 lt!385110) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385102 () (_ BitVec 64))

(assert (=> b!246925 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385102)))

(declare-fun lt!385121 () Unit!17918)

(assert (=> b!246925 (= lt!385121 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11522 lt!385109) (buf!6384 (_2!11522 lt!385103)) lt!385102))))

(assert (=> b!246925 (= lt!385110 (reader!0 (_2!11522 lt!385109) (_2!11522 lt!385103)))))

(declare-fun b!246926 () Bool)

(declare-fun res!206617 () Bool)

(assert (=> b!246926 (=> (not res!206617) (not e!171075))))

(assert (=> b!246926 (= res!206617 (bvslt from!289 nBits!297))))

(declare-fun res!206610 () Bool)

(assert (=> start!53134 (=> (not res!206610) (not e!171075))))

(assert (=> start!53134 (= res!206610 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53134 e!171075))

(assert (=> start!53134 true))

(declare-fun e!171073 () Bool)

(declare-fun inv!12 (BitStream!10728) Bool)

(assert (=> start!53134 (and (inv!12 thiss!1005) e!171073)))

(declare-fun b!246927 () Bool)

(declare-fun res!206624 () Bool)

(assert (=> b!246927 (=> (not res!206624) (not e!171066))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246927 (= res!206624 (invariant!0 (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385109)))))))

(declare-fun b!246928 () Bool)

(assert (=> b!246928 (= e!171070 e!171069)))

(declare-fun res!206609 () Bool)

(assert (=> b!246928 (=> res!206609 e!171069)))

(assert (=> b!246928 (= res!206609 (not (= (size!5903 (buf!6384 thiss!1005)) (size!5903 (buf!6384 (_2!11522 lt!385103))))))))

(assert (=> b!246928 (and (= (_2!11523 lt!385117) (_2!11523 lt!385113)) (= (_1!11523 lt!385117) (_2!11521 lt!385120)))))

(declare-fun b!246929 () Bool)

(declare-fun res!206622 () Bool)

(assert (=> b!246929 (=> res!206622 e!171069)))

(assert (=> b!246929 (= res!206622 (not (= (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385103))) (currentByte!11780 (_2!11522 lt!385103)) (currentBit!11775 (_2!11522 lt!385103))) (bvadd (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)) (bvsub nBits!297 from!289)))))))

(declare-fun b!246930 () Bool)

(declare-fun array_inv!5644 (array!13462) Bool)

(assert (=> b!246930 (= e!171073 (array_inv!5644 (buf!6384 thiss!1005)))))

(declare-fun b!246931 () Bool)

(assert (=> b!246931 (= e!171066 (invariant!0 (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385103)))))))

(declare-fun b!246932 () Bool)

(declare-fun res!206623 () Bool)

(assert (=> b!246932 (=> (not res!206623) (not e!171076))))

(assert (=> b!246932 (= res!206623 (isPrefixOf!0 thiss!1005 (_2!11522 lt!385109)))))

(declare-fun b!246933 () Bool)

(declare-fun res!206619 () Bool)

(assert (=> b!246933 (=> res!206619 e!171070)))

(declare-fun withMovedBitIndex!0 (BitStream!10728 (_ BitVec 64)) BitStream!10728)

(assert (=> b!246933 (= res!206619 (not (= (_1!11521 lt!385112) (withMovedBitIndex!0 (_1!11521 lt!385120) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246934 () Bool)

(declare-fun res!206613 () Bool)

(assert (=> b!246934 (=> (not res!206613) (not e!171072))))

(assert (=> b!246934 (= res!206613 (isPrefixOf!0 (_2!11522 lt!385109) (_2!11522 lt!385103)))))

(declare-fun b!246935 () Bool)

(declare-fun lt!385116 () (_ BitVec 64))

(assert (=> b!246935 (= e!171067 (= (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385122))) (currentByte!11780 (_1!11523 lt!385122)) (currentBit!11775 (_1!11523 lt!385122))) lt!385116))))

(declare-fun b!246936 () Bool)

(assert (=> b!246936 (= e!171074 e!171072)))

(declare-fun res!206621 () Bool)

(assert (=> b!246936 (=> (not res!206621) (not e!171072))))

(assert (=> b!246936 (= res!206621 (= (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385103))) (currentByte!11780 (_2!11522 lt!385103)) (currentBit!11775 (_2!11522 lt!385103))) (bvadd (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))) lt!385102)))))

(assert (=> b!246936 (= lt!385102 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246937 () Bool)

(assert (=> b!246937 (= e!171068 e!171076)))

(declare-fun res!206616 () Bool)

(assert (=> b!246937 (=> (not res!206616) (not e!171076))))

(declare-fun lt!385118 () (_ BitVec 64))

(assert (=> b!246937 (= res!206616 (= lt!385116 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!385118)))))

(assert (=> b!246937 (= lt!385116 (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))))))

(assert (=> b!246937 (= lt!385118 (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)))))

(declare-fun b!246938 () Bool)

(assert (=> b!246938 (= e!171077 (= (_2!11523 lt!385108) (_2!11523 lt!385105)))))

(assert (= (and start!53134 res!206610) b!246921))

(assert (= (and b!246921 res!206612) b!246926))

(assert (= (and b!246926 res!206617) b!246924))

(assert (= (and b!246924 res!206618) b!246937))

(assert (= (and b!246937 res!206616) b!246932))

(assert (= (and b!246932 res!206623) b!246923))

(assert (= (and b!246923 res!206614) b!246935))

(assert (= (and b!246924 res!206611) b!246936))

(assert (= (and b!246936 res!206621) b!246934))

(assert (= (and b!246934 res!206613) b!246925))

(assert (= (and b!246924 res!206620) b!246927))

(assert (= (and b!246927 res!206624) b!246931))

(assert (= (and b!246924 res!206625) b!246938))

(assert (= (and b!246924 (not res!206615)) b!246933))

(assert (= (and b!246933 (not res!206619)) b!246928))

(assert (= (and b!246928 (not res!206609)) b!246929))

(assert (= (and b!246929 (not res!206622)) b!246922))

(assert (= start!53134 b!246930))

(declare-fun m!372369 () Bool)

(assert (=> b!246932 m!372369))

(declare-fun m!372371 () Bool)

(assert (=> b!246921 m!372371))

(declare-fun m!372373 () Bool)

(assert (=> start!53134 m!372373))

(declare-fun m!372375 () Bool)

(assert (=> b!246934 m!372375))

(declare-fun m!372377 () Bool)

(assert (=> b!246937 m!372377))

(declare-fun m!372379 () Bool)

(assert (=> b!246937 m!372379))

(declare-fun m!372381 () Bool)

(assert (=> b!246930 m!372381))

(declare-fun m!372383 () Bool)

(assert (=> b!246924 m!372383))

(declare-fun m!372385 () Bool)

(assert (=> b!246924 m!372385))

(declare-fun m!372387 () Bool)

(assert (=> b!246924 m!372387))

(declare-fun m!372389 () Bool)

(assert (=> b!246924 m!372389))

(declare-fun m!372391 () Bool)

(assert (=> b!246924 m!372391))

(declare-fun m!372393 () Bool)

(assert (=> b!246924 m!372393))

(declare-fun m!372395 () Bool)

(assert (=> b!246924 m!372395))

(declare-fun m!372397 () Bool)

(assert (=> b!246924 m!372397))

(declare-fun m!372399 () Bool)

(assert (=> b!246924 m!372399))

(declare-fun m!372401 () Bool)

(assert (=> b!246924 m!372401))

(declare-fun m!372403 () Bool)

(assert (=> b!246924 m!372403))

(declare-fun m!372405 () Bool)

(assert (=> b!246924 m!372405))

(declare-fun m!372407 () Bool)

(assert (=> b!246924 m!372407))

(declare-fun m!372409 () Bool)

(assert (=> b!246924 m!372409))

(declare-fun m!372411 () Bool)

(assert (=> b!246924 m!372411))

(declare-fun m!372413 () Bool)

(assert (=> b!246924 m!372413))

(declare-fun m!372415 () Bool)

(assert (=> b!246924 m!372415))

(declare-fun m!372417 () Bool)

(assert (=> b!246924 m!372417))

(declare-fun m!372419 () Bool)

(assert (=> b!246924 m!372419))

(declare-fun m!372421 () Bool)

(assert (=> b!246924 m!372421))

(declare-fun m!372423 () Bool)

(assert (=> b!246933 m!372423))

(declare-fun m!372425 () Bool)

(assert (=> b!246929 m!372425))

(assert (=> b!246929 m!372379))

(declare-fun m!372427 () Bool)

(assert (=> b!246922 m!372427))

(declare-fun m!372429 () Bool)

(assert (=> b!246935 m!372429))

(declare-fun m!372431 () Bool)

(assert (=> b!246927 m!372431))

(assert (=> b!246936 m!372425))

(assert (=> b!246936 m!372377))

(declare-fun m!372433 () Bool)

(assert (=> b!246931 m!372433))

(declare-fun m!372435 () Bool)

(assert (=> b!246923 m!372435))

(assert (=> b!246923 m!372435))

(declare-fun m!372437 () Bool)

(assert (=> b!246923 m!372437))

(declare-fun m!372439 () Bool)

(assert (=> b!246925 m!372439))

(declare-fun m!372441 () Bool)

(assert (=> b!246925 m!372441))

(declare-fun m!372443 () Bool)

(assert (=> b!246925 m!372443))

(assert (=> b!246925 m!372385))

(check-sat (not b!246934) (not b!246933) (not start!53134) (not b!246937) (not b!246925) (not b!246930) (not b!246921) (not b!246927) (not b!246931) (not b!246922) (not b!246924) (not b!246923) (not b!246936) (not b!246929) (not b!246932) (not b!246935))
(check-sat)
(get-model)

(declare-fun d!82610 () Bool)

(declare-fun res!206683 () Bool)

(declare-fun e!171119 () Bool)

(assert (=> d!82610 (=> (not res!206683) (not e!171119))))

(assert (=> d!82610 (= res!206683 (= (size!5903 (buf!6384 thiss!1005)) (size!5903 (buf!6384 (_2!11522 lt!385109)))))))

(assert (=> d!82610 (= (isPrefixOf!0 thiss!1005 (_2!11522 lt!385109)) e!171119)))

(declare-fun b!246999 () Bool)

(declare-fun res!206684 () Bool)

(assert (=> b!246999 (=> (not res!206684) (not e!171119))))

(assert (=> b!246999 (= res!206684 (bvsle (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)) (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109)))))))

(declare-fun b!247000 () Bool)

(declare-fun e!171118 () Bool)

(assert (=> b!247000 (= e!171119 e!171118)))

(declare-fun res!206685 () Bool)

(assert (=> b!247000 (=> res!206685 e!171118)))

(assert (=> b!247000 (= res!206685 (= (size!5903 (buf!6384 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247001 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13462 array!13462 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247001 (= e!171118 (arrayBitRangesEq!0 (buf!6384 thiss!1005) (buf!6384 (_2!11522 lt!385109)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005))))))

(assert (= (and d!82610 res!206683) b!246999))

(assert (= (and b!246999 res!206684) b!247000))

(assert (= (and b!247000 (not res!206685)) b!247001))

(assert (=> b!246999 m!372379))

(assert (=> b!246999 m!372377))

(assert (=> b!247001 m!372379))

(assert (=> b!247001 m!372379))

(declare-fun m!372521 () Bool)

(assert (=> b!247001 m!372521))

(assert (=> b!246932 d!82610))

(declare-fun d!82612 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82612 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 thiss!1005))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 thiss!1005))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20916 () Bool)

(assert (= bs!20916 d!82612))

(declare-fun m!372523 () Bool)

(assert (=> bs!20916 m!372523))

(assert (=> b!246921 d!82612))

(declare-fun d!82614 () Bool)

(assert (=> d!82614 (= (invariant!0 (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385103)))) (and (bvsge (currentBit!11775 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11775 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11780 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385103)))) (and (= (currentBit!11775 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385103))))))))))

(assert (=> b!246931 d!82614))

(declare-fun d!82616 () Bool)

(assert (=> d!82616 (= (array_inv!5644 (buf!6384 thiss!1005)) (bvsge (size!5903 (buf!6384 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!246930 d!82616))

(declare-fun d!82618 () Bool)

(declare-fun e!171122 () Bool)

(assert (=> d!82618 e!171122))

(declare-fun res!206691 () Bool)

(assert (=> d!82618 (=> (not res!206691) (not e!171122))))

(declare-fun lt!385206 () (_ BitVec 64))

(declare-fun lt!385204 () (_ BitVec 64))

(declare-fun lt!385203 () (_ BitVec 64))

(assert (=> d!82618 (= res!206691 (= lt!385204 (bvsub lt!385203 lt!385206)))))

(assert (=> d!82618 (or (= (bvand lt!385203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385203 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385203 lt!385206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82618 (= lt!385206 (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385103))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385103)))))))

(declare-fun lt!385201 () (_ BitVec 64))

(declare-fun lt!385205 () (_ BitVec 64))

(assert (=> d!82618 (= lt!385203 (bvmul lt!385201 lt!385205))))

(assert (=> d!82618 (or (= lt!385201 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385205 (bvsdiv (bvmul lt!385201 lt!385205) lt!385201)))))

(assert (=> d!82618 (= lt!385205 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82618 (= lt!385201 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))))))

(assert (=> d!82618 (= lt!385204 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385103))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385103)))))))

(assert (=> d!82618 (invariant!0 (currentBit!11775 (_2!11522 lt!385103)) (currentByte!11780 (_2!11522 lt!385103)) (size!5903 (buf!6384 (_2!11522 lt!385103))))))

(assert (=> d!82618 (= (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385103))) (currentByte!11780 (_2!11522 lt!385103)) (currentBit!11775 (_2!11522 lt!385103))) lt!385204)))

(declare-fun b!247006 () Bool)

(declare-fun res!206690 () Bool)

(assert (=> b!247006 (=> (not res!206690) (not e!171122))))

(assert (=> b!247006 (= res!206690 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385204))))

(declare-fun b!247007 () Bool)

(declare-fun lt!385202 () (_ BitVec 64))

(assert (=> b!247007 (= e!171122 (bvsle lt!385204 (bvmul lt!385202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247007 (or (= lt!385202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385202)))))

(assert (=> b!247007 (= lt!385202 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))))))

(assert (= (and d!82618 res!206691) b!247006))

(assert (= (and b!247006 res!206690) b!247007))

(declare-fun m!372525 () Bool)

(assert (=> d!82618 m!372525))

(declare-fun m!372527 () Bool)

(assert (=> d!82618 m!372527))

(assert (=> b!246929 d!82618))

(declare-fun d!82620 () Bool)

(declare-fun e!171123 () Bool)

(assert (=> d!82620 e!171123))

(declare-fun res!206693 () Bool)

(assert (=> d!82620 (=> (not res!206693) (not e!171123))))

(declare-fun lt!385210 () (_ BitVec 64))

(declare-fun lt!385209 () (_ BitVec 64))

(declare-fun lt!385212 () (_ BitVec 64))

(assert (=> d!82620 (= res!206693 (= lt!385210 (bvsub lt!385209 lt!385212)))))

(assert (=> d!82620 (or (= (bvand lt!385209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385209 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385209 lt!385212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82620 (= lt!385212 (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 thiss!1005))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005))))))

(declare-fun lt!385207 () (_ BitVec 64))

(declare-fun lt!385211 () (_ BitVec 64))

(assert (=> d!82620 (= lt!385209 (bvmul lt!385207 lt!385211))))

(assert (=> d!82620 (or (= lt!385207 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385211 (bvsdiv (bvmul lt!385207 lt!385211) lt!385207)))))

(assert (=> d!82620 (= lt!385211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82620 (= lt!385207 ((_ sign_extend 32) (size!5903 (buf!6384 thiss!1005))))))

(assert (=> d!82620 (= lt!385210 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11780 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11775 thiss!1005))))))

(assert (=> d!82620 (invariant!0 (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005) (size!5903 (buf!6384 thiss!1005)))))

(assert (=> d!82620 (= (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)) lt!385210)))

(declare-fun b!247008 () Bool)

(declare-fun res!206692 () Bool)

(assert (=> b!247008 (=> (not res!206692) (not e!171123))))

(assert (=> b!247008 (= res!206692 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385210))))

(declare-fun b!247009 () Bool)

(declare-fun lt!385208 () (_ BitVec 64))

(assert (=> b!247009 (= e!171123 (bvsle lt!385210 (bvmul lt!385208 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247009 (or (= lt!385208 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385208 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385208)))))

(assert (=> b!247009 (= lt!385208 ((_ sign_extend 32) (size!5903 (buf!6384 thiss!1005))))))

(assert (= (and d!82620 res!206693) b!247008))

(assert (= (and b!247008 res!206692) b!247009))

(assert (=> d!82620 m!372523))

(declare-fun m!372529 () Bool)

(assert (=> d!82620 m!372529))

(assert (=> b!246929 d!82620))

(declare-fun d!82622 () Bool)

(assert (=> d!82622 (= (invariant!0 (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385109)))) (and (bvsge (currentBit!11775 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11775 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11780 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385109)))) (and (= (currentBit!11775 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385109))))))))))

(assert (=> b!246927 d!82622))

(declare-fun d!82624 () Bool)

(declare-fun e!171124 () Bool)

(assert (=> d!82624 e!171124))

(declare-fun res!206695 () Bool)

(assert (=> d!82624 (=> (not res!206695) (not e!171124))))

(declare-fun lt!385218 () (_ BitVec 64))

(declare-fun lt!385216 () (_ BitVec 64))

(declare-fun lt!385215 () (_ BitVec 64))

(assert (=> d!82624 (= res!206695 (= lt!385216 (bvsub lt!385215 lt!385218)))))

(assert (=> d!82624 (or (= (bvand lt!385215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385215 lt!385218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82624 (= lt!385218 (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109)))))))

(declare-fun lt!385213 () (_ BitVec 64))

(declare-fun lt!385217 () (_ BitVec 64))

(assert (=> d!82624 (= lt!385215 (bvmul lt!385213 lt!385217))))

(assert (=> d!82624 (or (= lt!385213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385217 (bvsdiv (bvmul lt!385213 lt!385217) lt!385213)))))

(assert (=> d!82624 (= lt!385217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82624 (= lt!385213 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))))))

(assert (=> d!82624 (= lt!385216 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109)))))))

(assert (=> d!82624 (invariant!0 (currentBit!11775 (_2!11522 lt!385109)) (currentByte!11780 (_2!11522 lt!385109)) (size!5903 (buf!6384 (_2!11522 lt!385109))))))

(assert (=> d!82624 (= (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))) lt!385216)))

(declare-fun b!247010 () Bool)

(declare-fun res!206694 () Bool)

(assert (=> b!247010 (=> (not res!206694) (not e!171124))))

(assert (=> b!247010 (= res!206694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385216))))

(declare-fun b!247011 () Bool)

(declare-fun lt!385214 () (_ BitVec 64))

(assert (=> b!247011 (= e!171124 (bvsle lt!385216 (bvmul lt!385214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247011 (or (= lt!385214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385214)))))

(assert (=> b!247011 (= lt!385214 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))))))

(assert (= (and d!82624 res!206695) b!247010))

(assert (= (and b!247010 res!206694) b!247011))

(declare-fun m!372531 () Bool)

(assert (=> d!82624 m!372531))

(declare-fun m!372533 () Bool)

(assert (=> d!82624 m!372533))

(assert (=> b!246937 d!82624))

(assert (=> b!246937 d!82620))

(assert (=> b!246936 d!82618))

(assert (=> b!246936 d!82624))

(declare-datatypes ((tuple2!21210 0))(
  ( (tuple2!21211 (_1!11527 Bool) (_2!11527 BitStream!10728)) )
))
(declare-fun lt!385221 () tuple2!21210)

(declare-fun d!82626 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10728 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21210)

(assert (=> d!82626 (= lt!385221 (checkBitsLoop!0 (_1!11521 lt!385110) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82626 (= (checkBitsLoopPure!0 (_1!11521 lt!385110) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21203 (_2!11527 lt!385221) (_1!11527 lt!385221)))))

(declare-fun bs!20917 () Bool)

(assert (= bs!20917 d!82626))

(declare-fun m!372535 () Bool)

(assert (=> bs!20917 m!372535))

(assert (=> b!246925 d!82626))

(declare-fun d!82628 () Bool)

(assert (=> d!82628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385102) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109)))) lt!385102))))

(declare-fun bs!20918 () Bool)

(assert (= bs!20918 d!82628))

(declare-fun m!372537 () Bool)

(assert (=> bs!20918 m!372537))

(assert (=> b!246925 d!82628))

(declare-fun d!82630 () Bool)

(assert (=> d!82630 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385102)))

(declare-fun lt!385224 () Unit!17918)

(declare-fun choose!9 (BitStream!10728 array!13462 (_ BitVec 64) BitStream!10728) Unit!17918)

(assert (=> d!82630 (= lt!385224 (choose!9 (_2!11522 lt!385109) (buf!6384 (_2!11522 lt!385103)) lt!385102 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109)))))))

(assert (=> d!82630 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11522 lt!385109) (buf!6384 (_2!11522 lt!385103)) lt!385102) lt!385224)))

(declare-fun bs!20919 () Bool)

(assert (= bs!20919 d!82630))

(assert (=> bs!20919 m!372441))

(declare-fun m!372539 () Bool)

(assert (=> bs!20919 m!372539))

(assert (=> b!246925 d!82630))

(declare-fun b!247022 () Bool)

(declare-fun e!171129 () Unit!17918)

(declare-fun lt!385273 () Unit!17918)

(assert (=> b!247022 (= e!171129 lt!385273)))

(declare-fun lt!385284 () (_ BitVec 64))

(assert (=> b!247022 (= lt!385284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!385281 () (_ BitVec 64))

(assert (=> b!247022 (= lt!385281 (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13462 array!13462 (_ BitVec 64) (_ BitVec 64)) Unit!17918)

(assert (=> b!247022 (= lt!385273 (arrayBitRangesEqSymmetric!0 (buf!6384 (_2!11522 lt!385109)) (buf!6384 (_2!11522 lt!385103)) lt!385284 lt!385281))))

(assert (=> b!247022 (arrayBitRangesEq!0 (buf!6384 (_2!11522 lt!385103)) (buf!6384 (_2!11522 lt!385109)) lt!385284 lt!385281)))

(declare-fun lt!385270 () (_ BitVec 64))

(declare-fun b!247023 () Bool)

(declare-fun lt!385283 () (_ BitVec 64))

(declare-fun lt!385274 () tuple2!21198)

(declare-fun e!171130 () Bool)

(assert (=> b!247023 (= e!171130 (= (_1!11521 lt!385274) (withMovedBitIndex!0 (_2!11521 lt!385274) (bvsub lt!385270 lt!385283))))))

(assert (=> b!247023 (or (= (bvand lt!385270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385283 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385270 lt!385283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247023 (= lt!385283 (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385103))) (currentByte!11780 (_2!11522 lt!385103)) (currentBit!11775 (_2!11522 lt!385103))))))

(assert (=> b!247023 (= lt!385270 (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))))))

(declare-fun d!82632 () Bool)

(assert (=> d!82632 e!171130))

(declare-fun res!206704 () Bool)

(assert (=> d!82632 (=> (not res!206704) (not e!171130))))

(assert (=> d!82632 (= res!206704 (isPrefixOf!0 (_1!11521 lt!385274) (_2!11521 lt!385274)))))

(declare-fun lt!385269 () BitStream!10728)

(assert (=> d!82632 (= lt!385274 (tuple2!21199 lt!385269 (_2!11522 lt!385103)))))

(declare-fun lt!385268 () Unit!17918)

(declare-fun lt!385276 () Unit!17918)

(assert (=> d!82632 (= lt!385268 lt!385276)))

(assert (=> d!82632 (isPrefixOf!0 lt!385269 (_2!11522 lt!385103))))

(assert (=> d!82632 (= lt!385276 (lemmaIsPrefixTransitive!0 lt!385269 (_2!11522 lt!385103) (_2!11522 lt!385103)))))

(declare-fun lt!385278 () Unit!17918)

(declare-fun lt!385271 () Unit!17918)

(assert (=> d!82632 (= lt!385278 lt!385271)))

(assert (=> d!82632 (isPrefixOf!0 lt!385269 (_2!11522 lt!385103))))

(assert (=> d!82632 (= lt!385271 (lemmaIsPrefixTransitive!0 lt!385269 (_2!11522 lt!385109) (_2!11522 lt!385103)))))

(declare-fun lt!385277 () Unit!17918)

(assert (=> d!82632 (= lt!385277 e!171129)))

(declare-fun c!11503 () Bool)

(assert (=> d!82632 (= c!11503 (not (= (size!5903 (buf!6384 (_2!11522 lt!385109))) #b00000000000000000000000000000000)))))

(declare-fun lt!385275 () Unit!17918)

(declare-fun lt!385265 () Unit!17918)

(assert (=> d!82632 (= lt!385275 lt!385265)))

(assert (=> d!82632 (isPrefixOf!0 (_2!11522 lt!385103) (_2!11522 lt!385103))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10728) Unit!17918)

(assert (=> d!82632 (= lt!385265 (lemmaIsPrefixRefl!0 (_2!11522 lt!385103)))))

(declare-fun lt!385282 () Unit!17918)

(declare-fun lt!385267 () Unit!17918)

(assert (=> d!82632 (= lt!385282 lt!385267)))

(assert (=> d!82632 (= lt!385267 (lemmaIsPrefixRefl!0 (_2!11522 lt!385103)))))

(declare-fun lt!385272 () Unit!17918)

(declare-fun lt!385266 () Unit!17918)

(assert (=> d!82632 (= lt!385272 lt!385266)))

(assert (=> d!82632 (isPrefixOf!0 lt!385269 lt!385269)))

(assert (=> d!82632 (= lt!385266 (lemmaIsPrefixRefl!0 lt!385269))))

(declare-fun lt!385280 () Unit!17918)

(declare-fun lt!385279 () Unit!17918)

(assert (=> d!82632 (= lt!385280 lt!385279)))

(assert (=> d!82632 (isPrefixOf!0 (_2!11522 lt!385109) (_2!11522 lt!385109))))

(assert (=> d!82632 (= lt!385279 (lemmaIsPrefixRefl!0 (_2!11522 lt!385109)))))

(assert (=> d!82632 (= lt!385269 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))))))

(assert (=> d!82632 (isPrefixOf!0 (_2!11522 lt!385109) (_2!11522 lt!385103))))

(assert (=> d!82632 (= (reader!0 (_2!11522 lt!385109) (_2!11522 lt!385103)) lt!385274)))

(declare-fun b!247024 () Bool)

(declare-fun Unit!17922 () Unit!17918)

(assert (=> b!247024 (= e!171129 Unit!17922)))

(declare-fun b!247025 () Bool)

(declare-fun res!206702 () Bool)

(assert (=> b!247025 (=> (not res!206702) (not e!171130))))

(assert (=> b!247025 (= res!206702 (isPrefixOf!0 (_2!11521 lt!385274) (_2!11522 lt!385103)))))

(declare-fun b!247026 () Bool)

(declare-fun res!206703 () Bool)

(assert (=> b!247026 (=> (not res!206703) (not e!171130))))

(assert (=> b!247026 (= res!206703 (isPrefixOf!0 (_1!11521 lt!385274) (_2!11522 lt!385109)))))

(assert (= (and d!82632 c!11503) b!247022))

(assert (= (and d!82632 (not c!11503)) b!247024))

(assert (= (and d!82632 res!206704) b!247026))

(assert (= (and b!247026 res!206703) b!247025))

(assert (= (and b!247025 res!206702) b!247023))

(declare-fun m!372541 () Bool)

(assert (=> d!82632 m!372541))

(declare-fun m!372543 () Bool)

(assert (=> d!82632 m!372543))

(declare-fun m!372545 () Bool)

(assert (=> d!82632 m!372545))

(declare-fun m!372547 () Bool)

(assert (=> d!82632 m!372547))

(declare-fun m!372549 () Bool)

(assert (=> d!82632 m!372549))

(declare-fun m!372551 () Bool)

(assert (=> d!82632 m!372551))

(declare-fun m!372553 () Bool)

(assert (=> d!82632 m!372553))

(declare-fun m!372555 () Bool)

(assert (=> d!82632 m!372555))

(declare-fun m!372557 () Bool)

(assert (=> d!82632 m!372557))

(assert (=> d!82632 m!372375))

(declare-fun m!372559 () Bool)

(assert (=> d!82632 m!372559))

(assert (=> b!247022 m!372377))

(declare-fun m!372561 () Bool)

(assert (=> b!247022 m!372561))

(declare-fun m!372563 () Bool)

(assert (=> b!247022 m!372563))

(declare-fun m!372565 () Bool)

(assert (=> b!247025 m!372565))

(declare-fun m!372567 () Bool)

(assert (=> b!247026 m!372567))

(declare-fun m!372569 () Bool)

(assert (=> b!247023 m!372569))

(assert (=> b!247023 m!372425))

(assert (=> b!247023 m!372377))

(assert (=> b!246925 d!82632))

(declare-fun d!82634 () Bool)

(declare-fun e!171131 () Bool)

(assert (=> d!82634 e!171131))

(declare-fun res!206706 () Bool)

(assert (=> d!82634 (=> (not res!206706) (not e!171131))))

(declare-fun lt!385287 () (_ BitVec 64))

(declare-fun lt!385288 () (_ BitVec 64))

(declare-fun lt!385290 () (_ BitVec 64))

(assert (=> d!82634 (= res!206706 (= lt!385288 (bvsub lt!385287 lt!385290)))))

(assert (=> d!82634 (or (= (bvand lt!385287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385290 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385287 lt!385290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82634 (= lt!385290 (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385122)))) ((_ sign_extend 32) (currentByte!11780 (_1!11523 lt!385122))) ((_ sign_extend 32) (currentBit!11775 (_1!11523 lt!385122)))))))

(declare-fun lt!385285 () (_ BitVec 64))

(declare-fun lt!385289 () (_ BitVec 64))

(assert (=> d!82634 (= lt!385287 (bvmul lt!385285 lt!385289))))

(assert (=> d!82634 (or (= lt!385285 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385289 (bvsdiv (bvmul lt!385285 lt!385289) lt!385285)))))

(assert (=> d!82634 (= lt!385289 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82634 (= lt!385285 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385122)))))))

(assert (=> d!82634 (= lt!385288 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11780 (_1!11523 lt!385122))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11775 (_1!11523 lt!385122)))))))

(assert (=> d!82634 (invariant!0 (currentBit!11775 (_1!11523 lt!385122)) (currentByte!11780 (_1!11523 lt!385122)) (size!5903 (buf!6384 (_1!11523 lt!385122))))))

(assert (=> d!82634 (= (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385122))) (currentByte!11780 (_1!11523 lt!385122)) (currentBit!11775 (_1!11523 lt!385122))) lt!385288)))

(declare-fun b!247027 () Bool)

(declare-fun res!206705 () Bool)

(assert (=> b!247027 (=> (not res!206705) (not e!171131))))

(assert (=> b!247027 (= res!206705 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385288))))

(declare-fun b!247028 () Bool)

(declare-fun lt!385286 () (_ BitVec 64))

(assert (=> b!247028 (= e!171131 (bvsle lt!385288 (bvmul lt!385286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247028 (or (= lt!385286 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385286 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385286)))))

(assert (=> b!247028 (= lt!385286 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385122)))))))

(assert (= (and d!82634 res!206706) b!247027))

(assert (= (and b!247027 res!206705) b!247028))

(declare-fun m!372571 () Bool)

(assert (=> d!82634 m!372571))

(declare-fun m!372573 () Bool)

(assert (=> d!82634 m!372573))

(assert (=> b!246935 d!82634))

(declare-fun b!247040 () Bool)

(declare-fun e!171137 () Bool)

(declare-fun lt!385309 () (_ BitVec 64))

(assert (=> b!247040 (= e!171137 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385309))))

(declare-fun d!82636 () Bool)

(declare-fun e!171136 () Bool)

(assert (=> d!82636 e!171136))

(declare-fun res!206715 () Bool)

(assert (=> d!82636 (=> (not res!206715) (not e!171136))))

(declare-fun lt!385307 () tuple2!21200)

(assert (=> d!82636 (= res!206715 (= (size!5903 (buf!6384 (_2!11522 lt!385109))) (size!5903 (buf!6384 (_2!11522 lt!385307)))))))

(declare-fun choose!51 (BitStream!10728 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21200)

(assert (=> d!82636 (= lt!385307 (choose!51 (_2!11522 lt!385109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82636 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!82636 (= (appendNBitsLoop!0 (_2!11522 lt!385109) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!385307)))

(declare-fun b!247037 () Bool)

(declare-fun res!206716 () Bool)

(assert (=> b!247037 (=> (not res!206716) (not e!171136))))

(declare-fun lt!385313 () (_ BitVec 64))

(declare-fun lt!385311 () (_ BitVec 64))

(assert (=> b!247037 (= res!206716 (= (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385307))) (currentByte!11780 (_2!11522 lt!385307)) (currentBit!11775 (_2!11522 lt!385307))) (bvadd lt!385311 lt!385313)))))

(assert (=> b!247037 (or (not (= (bvand lt!385311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385311 lt!385313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247037 (= lt!385313 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247037 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247037 (= lt!385311 (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))))))

(declare-fun b!247038 () Bool)

(declare-fun res!206718 () Bool)

(assert (=> b!247038 (=> (not res!206718) (not e!171136))))

(assert (=> b!247038 (= res!206718 (isPrefixOf!0 (_2!11522 lt!385109) (_2!11522 lt!385307)))))

(declare-fun b!247039 () Bool)

(declare-fun lt!385312 () tuple2!21202)

(declare-fun lt!385308 () tuple2!21198)

(assert (=> b!247039 (= e!171136 (and (_2!11523 lt!385312) (= (_1!11523 lt!385312) (_2!11521 lt!385308))))))

(assert (=> b!247039 (= lt!385312 (checkBitsLoopPure!0 (_1!11521 lt!385308) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!385314 () Unit!17918)

(declare-fun lt!385310 () Unit!17918)

(assert (=> b!247039 (= lt!385314 lt!385310)))

(assert (=> b!247039 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385307)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385309)))

(assert (=> b!247039 (= lt!385310 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11522 lt!385109) (buf!6384 (_2!11522 lt!385307)) lt!385309))))

(assert (=> b!247039 e!171137))

(declare-fun res!206717 () Bool)

(assert (=> b!247039 (=> (not res!206717) (not e!171137))))

(assert (=> b!247039 (= res!206717 (and (= (size!5903 (buf!6384 (_2!11522 lt!385109))) (size!5903 (buf!6384 (_2!11522 lt!385307)))) (bvsge lt!385309 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247039 (= lt!385309 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247039 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247039 (= lt!385308 (reader!0 (_2!11522 lt!385109) (_2!11522 lt!385307)))))

(assert (= (and d!82636 res!206715) b!247037))

(assert (= (and b!247037 res!206716) b!247038))

(assert (= (and b!247038 res!206718) b!247039))

(assert (= (and b!247039 res!206717) b!247040))

(declare-fun m!372575 () Bool)

(assert (=> b!247038 m!372575))

(declare-fun m!372577 () Bool)

(assert (=> b!247037 m!372577))

(assert (=> b!247037 m!372377))

(declare-fun m!372579 () Bool)

(assert (=> b!247040 m!372579))

(declare-fun m!372581 () Bool)

(assert (=> d!82636 m!372581))

(declare-fun m!372583 () Bool)

(assert (=> b!247039 m!372583))

(declare-fun m!372585 () Bool)

(assert (=> b!247039 m!372585))

(declare-fun m!372587 () Bool)

(assert (=> b!247039 m!372587))

(declare-fun m!372589 () Bool)

(assert (=> b!247039 m!372589))

(assert (=> b!246924 d!82636))

(declare-fun d!82638 () Bool)

(assert (=> d!82638 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!385315 () Unit!17918)

(assert (=> d!82638 (= lt!385315 (choose!9 thiss!1005 (buf!6384 (_2!11522 lt!385103)) (bvsub nBits!297 from!289) (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005))))))

(assert (=> d!82638 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6384 (_2!11522 lt!385103)) (bvsub nBits!297 from!289)) lt!385315)))

(declare-fun bs!20920 () Bool)

(assert (= bs!20920 d!82638))

(assert (=> bs!20920 m!372413))

(declare-fun m!372591 () Bool)

(assert (=> bs!20920 m!372591))

(assert (=> b!246924 d!82638))

(declare-fun lt!385316 () tuple2!21210)

(declare-fun d!82640 () Bool)

(assert (=> d!82640 (= lt!385316 (checkBitsLoop!0 (_1!11521 lt!385120) nBits!297 bit!26 from!289))))

(assert (=> d!82640 (= (checkBitsLoopPure!0 (_1!11521 lt!385120) nBits!297 bit!26 from!289) (tuple2!21203 (_2!11527 lt!385316) (_1!11527 lt!385316)))))

(declare-fun bs!20921 () Bool)

(assert (= bs!20921 d!82640))

(declare-fun m!372593 () Bool)

(assert (=> bs!20921 m!372593))

(assert (=> b!246924 d!82640))

(declare-fun d!82642 () Bool)

(declare-fun lt!385317 () tuple2!21210)

(assert (=> d!82642 (= lt!385317 (checkBitsLoop!0 (_1!11521 lt!385112) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!82642 (= (checkBitsLoopPure!0 (_1!11521 lt!385112) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21203 (_2!11527 lt!385317) (_1!11527 lt!385317)))))

(declare-fun bs!20922 () Bool)

(assert (= bs!20922 d!82642))

(declare-fun m!372595 () Bool)

(assert (=> bs!20922 m!372595))

(assert (=> b!246924 d!82642))

(declare-fun d!82644 () Bool)

(assert (=> d!82644 (isPrefixOf!0 thiss!1005 (_2!11522 lt!385103))))

(declare-fun lt!385320 () Unit!17918)

(declare-fun choose!30 (BitStream!10728 BitStream!10728 BitStream!10728) Unit!17918)

(assert (=> d!82644 (= lt!385320 (choose!30 thiss!1005 (_2!11522 lt!385109) (_2!11522 lt!385103)))))

(assert (=> d!82644 (isPrefixOf!0 thiss!1005 (_2!11522 lt!385109))))

(assert (=> d!82644 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11522 lt!385109) (_2!11522 lt!385103)) lt!385320)))

(declare-fun bs!20923 () Bool)

(assert (= bs!20923 d!82644))

(assert (=> bs!20923 m!372389))

(declare-fun m!372597 () Bool)

(assert (=> bs!20923 m!372597))

(assert (=> bs!20923 m!372369))

(assert (=> b!246924 d!82644))

(declare-fun d!82646 () Bool)

(assert (=> d!82646 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385111)))

(declare-fun lt!385321 () Unit!17918)

(assert (=> d!82646 (= lt!385321 (choose!9 (_2!11522 lt!385109) (buf!6384 (_2!11522 lt!385103)) lt!385111 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109)))))))

(assert (=> d!82646 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11522 lt!385109) (buf!6384 (_2!11522 lt!385103)) lt!385111) lt!385321)))

(declare-fun bs!20924 () Bool)

(assert (= bs!20924 d!82646))

(assert (=> bs!20924 m!372393))

(declare-fun m!372599 () Bool)

(assert (=> bs!20924 m!372599))

(assert (=> b!246924 d!82646))

(declare-fun d!82648 () Bool)

(declare-fun e!171138 () Bool)

(assert (=> d!82648 e!171138))

(declare-fun res!206720 () Bool)

(assert (=> d!82648 (=> (not res!206720) (not e!171138))))

(declare-fun lt!385327 () (_ BitVec 64))

(declare-fun lt!385324 () (_ BitVec 64))

(declare-fun lt!385325 () (_ BitVec 64))

(assert (=> d!82648 (= res!206720 (= lt!385325 (bvsub lt!385324 lt!385327)))))

(assert (=> d!82648 (or (= (bvand lt!385324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385324 lt!385327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82648 (= lt!385327 (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385105)))) ((_ sign_extend 32) (currentByte!11780 (_1!11523 lt!385105))) ((_ sign_extend 32) (currentBit!11775 (_1!11523 lt!385105)))))))

(declare-fun lt!385322 () (_ BitVec 64))

(declare-fun lt!385326 () (_ BitVec 64))

(assert (=> d!82648 (= lt!385324 (bvmul lt!385322 lt!385326))))

(assert (=> d!82648 (or (= lt!385322 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385326 (bvsdiv (bvmul lt!385322 lt!385326) lt!385322)))))

(assert (=> d!82648 (= lt!385326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82648 (= lt!385322 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385105)))))))

(assert (=> d!82648 (= lt!385325 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11780 (_1!11523 lt!385105))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11775 (_1!11523 lt!385105)))))))

(assert (=> d!82648 (invariant!0 (currentBit!11775 (_1!11523 lt!385105)) (currentByte!11780 (_1!11523 lt!385105)) (size!5903 (buf!6384 (_1!11523 lt!385105))))))

(assert (=> d!82648 (= (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385105))) (currentByte!11780 (_1!11523 lt!385105)) (currentBit!11775 (_1!11523 lt!385105))) lt!385325)))

(declare-fun b!247041 () Bool)

(declare-fun res!206719 () Bool)

(assert (=> b!247041 (=> (not res!206719) (not e!171138))))

(assert (=> b!247041 (= res!206719 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385325))))

(declare-fun b!247042 () Bool)

(declare-fun lt!385323 () (_ BitVec 64))

(assert (=> b!247042 (= e!171138 (bvsle lt!385325 (bvmul lt!385323 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247042 (or (= lt!385323 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385323 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385323)))))

(assert (=> b!247042 (= lt!385323 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385105)))))))

(assert (= (and d!82648 res!206720) b!247041))

(assert (= (and b!247041 res!206719) b!247042))

(declare-fun m!372601 () Bool)

(assert (=> d!82648 m!372601))

(declare-fun m!372603 () Bool)

(assert (=> d!82648 m!372603))

(assert (=> b!246924 d!82648))

(declare-fun d!82650 () Bool)

(declare-fun e!171141 () Bool)

(assert (=> d!82650 e!171141))

(declare-fun res!206723 () Bool)

(assert (=> d!82650 (=> (not res!206723) (not e!171141))))

(assert (=> d!82650 (= res!206723 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!385330 () Unit!17918)

(declare-fun choose!27 (BitStream!10728 BitStream!10728 (_ BitVec 64) (_ BitVec 64)) Unit!17918)

(assert (=> d!82650 (= lt!385330 (choose!27 thiss!1005 (_2!11522 lt!385109) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!82650 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!82650 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11522 lt!385109) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!385330)))

(declare-fun b!247045 () Bool)

(assert (=> b!247045 (= e!171141 (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!82650 res!206723) b!247045))

(declare-fun m!372605 () Bool)

(assert (=> d!82650 m!372605))

(declare-fun m!372607 () Bool)

(assert (=> b!247045 m!372607))

(assert (=> b!246924 d!82650))

(declare-fun d!82652 () Bool)

(declare-fun e!171144 () Bool)

(assert (=> d!82652 e!171144))

(declare-fun res!206726 () Bool)

(assert (=> d!82652 (=> (not res!206726) (not e!171144))))

(declare-fun lt!385340 () tuple2!21202)

(declare-fun lt!385339 () tuple2!21202)

(assert (=> d!82652 (= res!206726 (= (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385340))) (currentByte!11780 (_1!11523 lt!385340)) (currentBit!11775 (_1!11523 lt!385340))) (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385339))) (currentByte!11780 (_1!11523 lt!385339)) (currentBit!11775 (_1!11523 lt!385339)))))))

(declare-fun lt!385341 () BitStream!10728)

(declare-fun lt!385342 () Unit!17918)

(declare-fun choose!50 (BitStream!10728 BitStream!10728 BitStream!10728 tuple2!21202 tuple2!21202 BitStream!10728 Bool tuple2!21202 tuple2!21202 BitStream!10728 Bool) Unit!17918)

(assert (=> d!82652 (= lt!385342 (choose!50 lt!385115 (_2!11522 lt!385103) lt!385341 lt!385340 (tuple2!21203 (_1!11523 lt!385340) (_2!11523 lt!385340)) (_1!11523 lt!385340) (_2!11523 lt!385340) lt!385339 (tuple2!21203 (_1!11523 lt!385339) (_2!11523 lt!385339)) (_1!11523 lt!385339) (_2!11523 lt!385339)))))

(assert (=> d!82652 (= lt!385339 (readBitPure!0 lt!385341))))

(assert (=> d!82652 (= lt!385340 (readBitPure!0 lt!385115))))

(assert (=> d!82652 (= lt!385341 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 lt!385115) (currentBit!11775 lt!385115)))))

(assert (=> d!82652 (invariant!0 (currentBit!11775 lt!385115) (currentByte!11780 lt!385115) (size!5903 (buf!6384 (_2!11522 lt!385103))))))

(assert (=> d!82652 (= (readBitPrefixLemma!0 lt!385115 (_2!11522 lt!385103)) lt!385342)))

(declare-fun b!247048 () Bool)

(assert (=> b!247048 (= e!171144 (= (_2!11523 lt!385340) (_2!11523 lt!385339)))))

(assert (= (and d!82652 res!206726) b!247048))

(declare-fun m!372609 () Bool)

(assert (=> d!82652 m!372609))

(declare-fun m!372611 () Bool)

(assert (=> d!82652 m!372611))

(declare-fun m!372613 () Bool)

(assert (=> d!82652 m!372613))

(assert (=> d!82652 m!372419))

(declare-fun m!372615 () Bool)

(assert (=> d!82652 m!372615))

(declare-fun m!372617 () Bool)

(assert (=> d!82652 m!372617))

(assert (=> b!246924 d!82652))

(declare-fun d!82654 () Bool)

(assert (=> d!82654 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385111) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109)))) lt!385111))))

(declare-fun bs!20925 () Bool)

(assert (= bs!20925 d!82654))

(assert (=> bs!20925 m!372537))

(assert (=> b!246924 d!82654))

(declare-fun b!247059 () Bool)

(declare-fun res!206736 () Bool)

(declare-fun e!171150 () Bool)

(assert (=> b!247059 (=> (not res!206736) (not e!171150))))

(declare-fun lt!385353 () tuple2!21200)

(assert (=> b!247059 (= res!206736 (isPrefixOf!0 thiss!1005 (_2!11522 lt!385353)))))

(declare-fun b!247060 () Bool)

(declare-fun e!171149 () Bool)

(assert (=> b!247060 (= e!171150 e!171149)))

(declare-fun res!206735 () Bool)

(assert (=> b!247060 (=> (not res!206735) (not e!171149))))

(declare-fun lt!385352 () tuple2!21202)

(assert (=> b!247060 (= res!206735 (and (= (_2!11523 lt!385352) bit!26) (= (_1!11523 lt!385352) (_2!11522 lt!385353))))))

(assert (=> b!247060 (= lt!385352 (readBitPure!0 (readerFrom!0 (_2!11522 lt!385353) (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005))))))

(declare-fun b!247061 () Bool)

(assert (=> b!247061 (= e!171149 (= (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385352))) (currentByte!11780 (_1!11523 lt!385352)) (currentBit!11775 (_1!11523 lt!385352))) (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385353))) (currentByte!11780 (_2!11522 lt!385353)) (currentBit!11775 (_2!11522 lt!385353)))))))

(declare-fun d!82656 () Bool)

(assert (=> d!82656 e!171150))

(declare-fun res!206737 () Bool)

(assert (=> d!82656 (=> (not res!206737) (not e!171150))))

(assert (=> d!82656 (= res!206737 (= (size!5903 (buf!6384 thiss!1005)) (size!5903 (buf!6384 (_2!11522 lt!385353)))))))

(declare-fun choose!16 (BitStream!10728 Bool) tuple2!21200)

(assert (=> d!82656 (= lt!385353 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!82656 (validate_offset_bit!0 ((_ sign_extend 32) (size!5903 (buf!6384 thiss!1005))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005)))))

(assert (=> d!82656 (= (appendBit!0 thiss!1005 bit!26) lt!385353)))

(declare-fun b!247058 () Bool)

(declare-fun res!206738 () Bool)

(assert (=> b!247058 (=> (not res!206738) (not e!171150))))

(declare-fun lt!385354 () (_ BitVec 64))

(declare-fun lt!385351 () (_ BitVec 64))

(assert (=> b!247058 (= res!206738 (= (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385353))) (currentByte!11780 (_2!11522 lt!385353)) (currentBit!11775 (_2!11522 lt!385353))) (bvadd lt!385354 lt!385351)))))

(assert (=> b!247058 (or (not (= (bvand lt!385354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385351 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385354 lt!385351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247058 (= lt!385351 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!247058 (= lt!385354 (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)))))

(assert (= (and d!82656 res!206737) b!247058))

(assert (= (and b!247058 res!206738) b!247059))

(assert (= (and b!247059 res!206736) b!247060))

(assert (= (and b!247060 res!206735) b!247061))

(declare-fun m!372619 () Bool)

(assert (=> b!247060 m!372619))

(assert (=> b!247060 m!372619))

(declare-fun m!372621 () Bool)

(assert (=> b!247060 m!372621))

(declare-fun m!372623 () Bool)

(assert (=> d!82656 m!372623))

(declare-fun m!372625 () Bool)

(assert (=> d!82656 m!372625))

(declare-fun m!372627 () Bool)

(assert (=> b!247061 m!372627))

(declare-fun m!372629 () Bool)

(assert (=> b!247061 m!372629))

(assert (=> b!247058 m!372629))

(assert (=> b!247058 m!372379))

(declare-fun m!372631 () Bool)

(assert (=> b!247059 m!372631))

(assert (=> b!246924 d!82656))

(declare-fun d!82658 () Bool)

(declare-fun lt!385357 () tuple2!21210)

(declare-fun readBit!0 (BitStream!10728) tuple2!21210)

(assert (=> d!82658 (= lt!385357 (readBit!0 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005))))))

(assert (=> d!82658 (= (readBitPure!0 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005))) (tuple2!21203 (_2!11527 lt!385357) (_1!11527 lt!385357)))))

(declare-fun bs!20926 () Bool)

(assert (= bs!20926 d!82658))

(declare-fun m!372633 () Bool)

(assert (=> bs!20926 m!372633))

(assert (=> b!246924 d!82658))

(declare-fun b!247062 () Bool)

(declare-fun e!171151 () Unit!17918)

(declare-fun lt!385366 () Unit!17918)

(assert (=> b!247062 (= e!171151 lt!385366)))

(declare-fun lt!385377 () (_ BitVec 64))

(assert (=> b!247062 (= lt!385377 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!385374 () (_ BitVec 64))

(assert (=> b!247062 (= lt!385374 (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)))))

(assert (=> b!247062 (= lt!385366 (arrayBitRangesEqSymmetric!0 (buf!6384 thiss!1005) (buf!6384 (_2!11522 lt!385103)) lt!385377 lt!385374))))

(assert (=> b!247062 (arrayBitRangesEq!0 (buf!6384 (_2!11522 lt!385103)) (buf!6384 thiss!1005) lt!385377 lt!385374)))

(declare-fun lt!385367 () tuple2!21198)

(declare-fun lt!385363 () (_ BitVec 64))

(declare-fun b!247063 () Bool)

(declare-fun e!171152 () Bool)

(declare-fun lt!385376 () (_ BitVec 64))

(assert (=> b!247063 (= e!171152 (= (_1!11521 lt!385367) (withMovedBitIndex!0 (_2!11521 lt!385367) (bvsub lt!385363 lt!385376))))))

(assert (=> b!247063 (or (= (bvand lt!385363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385376 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385363 lt!385376) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247063 (= lt!385376 (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385103))) (currentByte!11780 (_2!11522 lt!385103)) (currentBit!11775 (_2!11522 lt!385103))))))

(assert (=> b!247063 (= lt!385363 (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)))))

(declare-fun d!82660 () Bool)

(assert (=> d!82660 e!171152))

(declare-fun res!206741 () Bool)

(assert (=> d!82660 (=> (not res!206741) (not e!171152))))

(assert (=> d!82660 (= res!206741 (isPrefixOf!0 (_1!11521 lt!385367) (_2!11521 lt!385367)))))

(declare-fun lt!385362 () BitStream!10728)

(assert (=> d!82660 (= lt!385367 (tuple2!21199 lt!385362 (_2!11522 lt!385103)))))

(declare-fun lt!385361 () Unit!17918)

(declare-fun lt!385369 () Unit!17918)

(assert (=> d!82660 (= lt!385361 lt!385369)))

(assert (=> d!82660 (isPrefixOf!0 lt!385362 (_2!11522 lt!385103))))

(assert (=> d!82660 (= lt!385369 (lemmaIsPrefixTransitive!0 lt!385362 (_2!11522 lt!385103) (_2!11522 lt!385103)))))

(declare-fun lt!385371 () Unit!17918)

(declare-fun lt!385364 () Unit!17918)

(assert (=> d!82660 (= lt!385371 lt!385364)))

(assert (=> d!82660 (isPrefixOf!0 lt!385362 (_2!11522 lt!385103))))

(assert (=> d!82660 (= lt!385364 (lemmaIsPrefixTransitive!0 lt!385362 thiss!1005 (_2!11522 lt!385103)))))

(declare-fun lt!385370 () Unit!17918)

(assert (=> d!82660 (= lt!385370 e!171151)))

(declare-fun c!11504 () Bool)

(assert (=> d!82660 (= c!11504 (not (= (size!5903 (buf!6384 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!385368 () Unit!17918)

(declare-fun lt!385358 () Unit!17918)

(assert (=> d!82660 (= lt!385368 lt!385358)))

(assert (=> d!82660 (isPrefixOf!0 (_2!11522 lt!385103) (_2!11522 lt!385103))))

(assert (=> d!82660 (= lt!385358 (lemmaIsPrefixRefl!0 (_2!11522 lt!385103)))))

(declare-fun lt!385375 () Unit!17918)

(declare-fun lt!385360 () Unit!17918)

(assert (=> d!82660 (= lt!385375 lt!385360)))

(assert (=> d!82660 (= lt!385360 (lemmaIsPrefixRefl!0 (_2!11522 lt!385103)))))

(declare-fun lt!385365 () Unit!17918)

(declare-fun lt!385359 () Unit!17918)

(assert (=> d!82660 (= lt!385365 lt!385359)))

(assert (=> d!82660 (isPrefixOf!0 lt!385362 lt!385362)))

(assert (=> d!82660 (= lt!385359 (lemmaIsPrefixRefl!0 lt!385362))))

(declare-fun lt!385373 () Unit!17918)

(declare-fun lt!385372 () Unit!17918)

(assert (=> d!82660 (= lt!385373 lt!385372)))

(assert (=> d!82660 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82660 (= lt!385372 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82660 (= lt!385362 (BitStream!10729 (buf!6384 (_2!11522 lt!385103)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)))))

(assert (=> d!82660 (isPrefixOf!0 thiss!1005 (_2!11522 lt!385103))))

(assert (=> d!82660 (= (reader!0 thiss!1005 (_2!11522 lt!385103)) lt!385367)))

(declare-fun b!247064 () Bool)

(declare-fun Unit!17923 () Unit!17918)

(assert (=> b!247064 (= e!171151 Unit!17923)))

(declare-fun b!247065 () Bool)

(declare-fun res!206739 () Bool)

(assert (=> b!247065 (=> (not res!206739) (not e!171152))))

(assert (=> b!247065 (= res!206739 (isPrefixOf!0 (_2!11521 lt!385367) (_2!11522 lt!385103)))))

(declare-fun b!247066 () Bool)

(declare-fun res!206740 () Bool)

(assert (=> b!247066 (=> (not res!206740) (not e!171152))))

(assert (=> b!247066 (= res!206740 (isPrefixOf!0 (_1!11521 lt!385367) thiss!1005))))

(assert (= (and d!82660 c!11504) b!247062))

(assert (= (and d!82660 (not c!11504)) b!247064))

(assert (= (and d!82660 res!206741) b!247066))

(assert (= (and b!247066 res!206740) b!247065))

(assert (= (and b!247065 res!206739) b!247063))

(declare-fun m!372635 () Bool)

(assert (=> d!82660 m!372635))

(declare-fun m!372637 () Bool)

(assert (=> d!82660 m!372637))

(assert (=> d!82660 m!372545))

(assert (=> d!82660 m!372547))

(declare-fun m!372639 () Bool)

(assert (=> d!82660 m!372639))

(declare-fun m!372641 () Bool)

(assert (=> d!82660 m!372641))

(declare-fun m!372643 () Bool)

(assert (=> d!82660 m!372643))

(declare-fun m!372645 () Bool)

(assert (=> d!82660 m!372645))

(declare-fun m!372647 () Bool)

(assert (=> d!82660 m!372647))

(assert (=> d!82660 m!372389))

(declare-fun m!372649 () Bool)

(assert (=> d!82660 m!372649))

(assert (=> b!247062 m!372379))

(declare-fun m!372651 () Bool)

(assert (=> b!247062 m!372651))

(declare-fun m!372653 () Bool)

(assert (=> b!247062 m!372653))

(declare-fun m!372655 () Bool)

(assert (=> b!247065 m!372655))

(declare-fun m!372657 () Bool)

(assert (=> b!247066 m!372657))

(declare-fun m!372659 () Bool)

(assert (=> b!247063 m!372659))

(assert (=> b!247063 m!372425))

(assert (=> b!247063 m!372379))

(assert (=> b!246924 d!82660))

(declare-fun d!82662 () Bool)

(assert (=> d!82662 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385103)))) ((_ sign_extend 32) (currentByte!11780 thiss!1005)) ((_ sign_extend 32) (currentBit!11775 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20927 () Bool)

(assert (= bs!20927 d!82662))

(declare-fun m!372661 () Bool)

(assert (=> bs!20927 m!372661))

(assert (=> b!246924 d!82662))

(declare-fun d!82664 () Bool)

(declare-fun res!206742 () Bool)

(declare-fun e!171154 () Bool)

(assert (=> d!82664 (=> (not res!206742) (not e!171154))))

(assert (=> d!82664 (= res!206742 (= (size!5903 (buf!6384 thiss!1005)) (size!5903 (buf!6384 (_2!11522 lt!385103)))))))

(assert (=> d!82664 (= (isPrefixOf!0 thiss!1005 (_2!11522 lt!385103)) e!171154)))

(declare-fun b!247067 () Bool)

(declare-fun res!206743 () Bool)

(assert (=> b!247067 (=> (not res!206743) (not e!171154))))

(assert (=> b!247067 (= res!206743 (bvsle (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)) (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385103))) (currentByte!11780 (_2!11522 lt!385103)) (currentBit!11775 (_2!11522 lt!385103)))))))

(declare-fun b!247068 () Bool)

(declare-fun e!171153 () Bool)

(assert (=> b!247068 (= e!171154 e!171153)))

(declare-fun res!206744 () Bool)

(assert (=> b!247068 (=> res!206744 e!171153)))

(assert (=> b!247068 (= res!206744 (= (size!5903 (buf!6384 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247069 () Bool)

(assert (=> b!247069 (= e!171153 (arrayBitRangesEq!0 (buf!6384 thiss!1005) (buf!6384 (_2!11522 lt!385103)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5903 (buf!6384 thiss!1005)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005))))))

(assert (= (and d!82664 res!206742) b!247067))

(assert (= (and b!247067 res!206743) b!247068))

(assert (= (and b!247068 (not res!206744)) b!247069))

(assert (=> b!247067 m!372379))

(assert (=> b!247067 m!372425))

(assert (=> b!247069 m!372379))

(assert (=> b!247069 m!372379))

(declare-fun m!372663 () Bool)

(assert (=> b!247069 m!372663))

(assert (=> b!246924 d!82664))

(assert (=> b!246924 d!82632))

(declare-fun d!82666 () Bool)

(declare-fun lt!385378 () tuple2!21210)

(assert (=> d!82666 (= lt!385378 (readBit!0 lt!385115))))

(assert (=> d!82666 (= (readBitPure!0 lt!385115) (tuple2!21203 (_2!11527 lt!385378) (_1!11527 lt!385378)))))

(declare-fun bs!20928 () Bool)

(assert (= bs!20928 d!82666))

(declare-fun m!372665 () Bool)

(assert (=> bs!20928 m!372665))

(assert (=> b!246924 d!82666))

(declare-fun d!82668 () Bool)

(declare-fun lt!385379 () tuple2!21210)

(assert (=> d!82668 (= lt!385379 (readBit!0 (_1!11521 lt!385120)))))

(assert (=> d!82668 (= (readBitPure!0 (_1!11521 lt!385120)) (tuple2!21203 (_2!11527 lt!385379) (_1!11527 lt!385379)))))

(declare-fun bs!20929 () Bool)

(assert (= bs!20929 d!82668))

(declare-fun m!372667 () Bool)

(assert (=> bs!20929 m!372667))

(assert (=> b!246924 d!82668))

(declare-fun d!82670 () Bool)

(declare-fun e!171155 () Bool)

(assert (=> d!82670 e!171155))

(declare-fun res!206746 () Bool)

(assert (=> d!82670 (=> (not res!206746) (not e!171155))))

(declare-fun lt!385382 () (_ BitVec 64))

(declare-fun lt!385383 () (_ BitVec 64))

(declare-fun lt!385385 () (_ BitVec 64))

(assert (=> d!82670 (= res!206746 (= lt!385383 (bvsub lt!385382 lt!385385)))))

(assert (=> d!82670 (or (= (bvand lt!385382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!385385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!385382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!385382 lt!385385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82670 (= lt!385385 (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385108)))) ((_ sign_extend 32) (currentByte!11780 (_1!11523 lt!385108))) ((_ sign_extend 32) (currentBit!11775 (_1!11523 lt!385108)))))))

(declare-fun lt!385380 () (_ BitVec 64))

(declare-fun lt!385384 () (_ BitVec 64))

(assert (=> d!82670 (= lt!385382 (bvmul lt!385380 lt!385384))))

(assert (=> d!82670 (or (= lt!385380 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!385384 (bvsdiv (bvmul lt!385380 lt!385384) lt!385380)))))

(assert (=> d!82670 (= lt!385384 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82670 (= lt!385380 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385108)))))))

(assert (=> d!82670 (= lt!385383 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11780 (_1!11523 lt!385108))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11775 (_1!11523 lt!385108)))))))

(assert (=> d!82670 (invariant!0 (currentBit!11775 (_1!11523 lt!385108)) (currentByte!11780 (_1!11523 lt!385108)) (size!5903 (buf!6384 (_1!11523 lt!385108))))))

(assert (=> d!82670 (= (bitIndex!0 (size!5903 (buf!6384 (_1!11523 lt!385108))) (currentByte!11780 (_1!11523 lt!385108)) (currentBit!11775 (_1!11523 lt!385108))) lt!385383)))

(declare-fun b!247070 () Bool)

(declare-fun res!206745 () Bool)

(assert (=> b!247070 (=> (not res!206745) (not e!171155))))

(assert (=> b!247070 (= res!206745 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!385383))))

(declare-fun b!247071 () Bool)

(declare-fun lt!385381 () (_ BitVec 64))

(assert (=> b!247071 (= e!171155 (bvsle lt!385383 (bvmul lt!385381 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247071 (or (= lt!385381 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!385381 #b0000000000000000000000000000000000000000000000000000000000001000) lt!385381)))))

(assert (=> b!247071 (= lt!385381 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11523 lt!385108)))))))

(assert (= (and d!82670 res!206746) b!247070))

(assert (= (and b!247070 res!206745) b!247071))

(declare-fun m!372669 () Bool)

(assert (=> d!82670 m!372669))

(declare-fun m!372671 () Bool)

(assert (=> d!82670 m!372671))

(assert (=> b!246924 d!82670))

(declare-fun d!82672 () Bool)

(assert (=> d!82672 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109))) lt!385111) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_2!11522 lt!385109)))) ((_ sign_extend 32) (currentByte!11780 (_2!11522 lt!385109))) ((_ sign_extend 32) (currentBit!11775 (_2!11522 lt!385109)))) lt!385111))))

(declare-fun bs!20930 () Bool)

(assert (= bs!20930 d!82672))

(assert (=> bs!20930 m!372531))

(assert (=> b!246924 d!82672))

(declare-fun d!82674 () Bool)

(declare-fun res!206747 () Bool)

(declare-fun e!171157 () Bool)

(assert (=> d!82674 (=> (not res!206747) (not e!171157))))

(assert (=> d!82674 (= res!206747 (= (size!5903 (buf!6384 (_2!11522 lt!385109))) (size!5903 (buf!6384 (_2!11522 lt!385103)))))))

(assert (=> d!82674 (= (isPrefixOf!0 (_2!11522 lt!385109) (_2!11522 lt!385103)) e!171157)))

(declare-fun b!247072 () Bool)

(declare-fun res!206748 () Bool)

(assert (=> b!247072 (=> (not res!206748) (not e!171157))))

(assert (=> b!247072 (= res!206748 (bvsle (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109))) (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385103))) (currentByte!11780 (_2!11522 lt!385103)) (currentBit!11775 (_2!11522 lt!385103)))))))

(declare-fun b!247073 () Bool)

(declare-fun e!171156 () Bool)

(assert (=> b!247073 (= e!171157 e!171156)))

(declare-fun res!206749 () Bool)

(assert (=> b!247073 (=> res!206749 e!171156)))

(assert (=> b!247073 (= res!206749 (= (size!5903 (buf!6384 (_2!11522 lt!385109))) #b00000000000000000000000000000000))))

(declare-fun b!247074 () Bool)

(assert (=> b!247074 (= e!171156 (arrayBitRangesEq!0 (buf!6384 (_2!11522 lt!385109)) (buf!6384 (_2!11522 lt!385103)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5903 (buf!6384 (_2!11522 lt!385109))) (currentByte!11780 (_2!11522 lt!385109)) (currentBit!11775 (_2!11522 lt!385109)))))))

(assert (= (and d!82674 res!206747) b!247072))

(assert (= (and b!247072 res!206748) b!247073))

(assert (= (and b!247073 (not res!206749)) b!247074))

(assert (=> b!247072 m!372377))

(assert (=> b!247072 m!372425))

(assert (=> b!247074 m!372377))

(assert (=> b!247074 m!372377))

(declare-fun m!372673 () Bool)

(assert (=> b!247074 m!372673))

(assert (=> b!246934 d!82674))

(declare-fun d!82676 () Bool)

(declare-fun lt!385386 () tuple2!21210)

(assert (=> d!82676 (= lt!385386 (readBit!0 (readerFrom!0 (_2!11522 lt!385109) (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005))))))

(assert (=> d!82676 (= (readBitPure!0 (readerFrom!0 (_2!11522 lt!385109) (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005))) (tuple2!21203 (_2!11527 lt!385386) (_1!11527 lt!385386)))))

(declare-fun bs!20931 () Bool)

(assert (= bs!20931 d!82676))

(assert (=> bs!20931 m!372435))

(declare-fun m!372675 () Bool)

(assert (=> bs!20931 m!372675))

(assert (=> b!246923 d!82676))

(declare-fun d!82678 () Bool)

(declare-fun e!171160 () Bool)

(assert (=> d!82678 e!171160))

(declare-fun res!206753 () Bool)

(assert (=> d!82678 (=> (not res!206753) (not e!171160))))

(assert (=> d!82678 (= res!206753 (invariant!0 (currentBit!11775 (_2!11522 lt!385109)) (currentByte!11780 (_2!11522 lt!385109)) (size!5903 (buf!6384 (_2!11522 lt!385109)))))))

(assert (=> d!82678 (= (readerFrom!0 (_2!11522 lt!385109) (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005)) (BitStream!10729 (buf!6384 (_2!11522 lt!385109)) (currentByte!11780 thiss!1005) (currentBit!11775 thiss!1005)))))

(declare-fun b!247077 () Bool)

(assert (=> b!247077 (= e!171160 (invariant!0 (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005) (size!5903 (buf!6384 (_2!11522 lt!385109)))))))

(assert (= (and d!82678 res!206753) b!247077))

(assert (=> d!82678 m!372533))

(assert (=> b!247077 m!372431))

(assert (=> b!246923 d!82678))

(declare-fun d!82680 () Bool)

(declare-fun e!171163 () Bool)

(assert (=> d!82680 e!171163))

(declare-fun res!206756 () Bool)

(assert (=> d!82680 (=> (not res!206756) (not e!171163))))

(declare-fun lt!385392 () (_ BitVec 64))

(declare-fun lt!385391 () BitStream!10728)

(assert (=> d!82680 (= res!206756 (= (bvadd lt!385392 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!5903 (buf!6384 lt!385391)) (currentByte!11780 lt!385391) (currentBit!11775 lt!385391))))))

(assert (=> d!82680 (or (not (= (bvand lt!385392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!385392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!385392 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82680 (= lt!385392 (bitIndex!0 (size!5903 (buf!6384 (_1!11521 lt!385120))) (currentByte!11780 (_1!11521 lt!385120)) (currentBit!11775 (_1!11521 lt!385120))))))

(declare-fun moveBitIndex!0 (BitStream!10728 (_ BitVec 64)) tuple2!21200)

(assert (=> d!82680 (= lt!385391 (_2!11522 (moveBitIndex!0 (_1!11521 lt!385120) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!10728 (_ BitVec 64)) Bool)

(assert (=> d!82680 (moveBitIndexPrecond!0 (_1!11521 lt!385120) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!82680 (= (withMovedBitIndex!0 (_1!11521 lt!385120) #b0000000000000000000000000000000000000000000000000000000000000001) lt!385391)))

(declare-fun b!247080 () Bool)

(assert (=> b!247080 (= e!171163 (= (size!5903 (buf!6384 (_1!11521 lt!385120))) (size!5903 (buf!6384 lt!385391))))))

(assert (= (and d!82680 res!206756) b!247080))

(declare-fun m!372677 () Bool)

(assert (=> d!82680 m!372677))

(declare-fun m!372679 () Bool)

(assert (=> d!82680 m!372679))

(declare-fun m!372681 () Bool)

(assert (=> d!82680 m!372681))

(declare-fun m!372683 () Bool)

(assert (=> d!82680 m!372683))

(assert (=> b!246933 d!82680))

(declare-fun d!82682 () Bool)

(assert (=> d!82682 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11521 lt!385120)))) ((_ sign_extend 32) (currentByte!11780 (_1!11521 lt!385120))) ((_ sign_extend 32) (currentBit!11775 (_1!11521 lt!385120))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5903 (buf!6384 (_1!11521 lt!385120)))) ((_ sign_extend 32) (currentByte!11780 (_1!11521 lt!385120))) ((_ sign_extend 32) (currentBit!11775 (_1!11521 lt!385120)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20932 () Bool)

(assert (= bs!20932 d!82682))

(declare-fun m!372685 () Bool)

(assert (=> bs!20932 m!372685))

(assert (=> b!246922 d!82682))

(declare-fun d!82684 () Bool)

(assert (=> d!82684 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11775 thiss!1005) (currentByte!11780 thiss!1005) (size!5903 (buf!6384 thiss!1005))))))

(declare-fun bs!20933 () Bool)

(assert (= bs!20933 d!82684))

(assert (=> bs!20933 m!372529))

(assert (=> start!53134 d!82684))

(check-sat (not d!82668) (not d!82652) (not d!82680) (not d!82650) (not b!247067) (not d!82678) (not b!247058) (not d!82628) (not d!82638) (not d!82654) (not b!247077) (not b!247074) (not b!247038) (not d!82666) (not d!82632) (not d!82620) (not d!82660) (not d!82612) (not b!247062) (not d!82640) (not b!247045) (not d!82648) (not b!247063) (not d!82656) (not b!246999) (not b!247066) (not b!247059) (not b!247037) (not d!82642) (not b!247023) (not b!247039) (not b!247040) (not b!247072) (not d!82626) (not d!82644) (not d!82634) (not d!82636) (not d!82670) (not d!82658) (not d!82684) (not d!82682) (not d!82662) (not b!247026) (not d!82646) (not b!247065) (not d!82624) (not d!82672) (not b!247001) (not b!247061) (not b!247025) (not b!247069) (not b!247060) (not d!82676) (not b!247022) (not d!82630) (not d!82618))
(check-sat)
