; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17840 () Bool)

(assert start!17840)

(declare-fun b!86923 () Bool)

(declare-fun e!57698 () Bool)

(declare-fun e!57702 () Bool)

(assert (=> b!86923 (= e!57698 e!57702)))

(declare-fun res!71455 () Bool)

(assert (=> b!86923 (=> (not res!71455) (not e!57702))))

(declare-fun lt!135454 () (_ BitVec 64))

(declare-fun lt!135451 () (_ BitVec 64))

(assert (=> b!86923 (= res!71455 (= lt!135454 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135451)))))

(declare-datatypes ((array!4108 0))(
  ( (array!4109 (arr!2492 (Array (_ BitVec 32) (_ BitVec 8))) (size!1855 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3272 0))(
  ( (BitStream!3273 (buf!2245 array!4108) (currentByte!4460 (_ BitVec 32)) (currentBit!4455 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5729 0))(
  ( (Unit!5730) )
))
(declare-datatypes ((tuple2!7356 0))(
  ( (tuple2!7357 (_1!3907 Unit!5729) (_2!3907 BitStream!3272)) )
))
(declare-fun lt!135456 () tuple2!7356)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!86923 (= lt!135454 (bitIndex!0 (size!1855 (buf!2245 (_2!3907 lt!135456))) (currentByte!4460 (_2!3907 lt!135456)) (currentBit!4455 (_2!3907 lt!135456))))))

(declare-fun b!86924 () Bool)

(declare-fun res!71453 () Bool)

(declare-fun e!57700 () Bool)

(assert (=> b!86924 (=> (not res!71453) (not e!57700))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!86924 (= res!71453 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!86925 () Bool)

(declare-fun res!71448 () Bool)

(assert (=> b!86925 (=> (not res!71448) (not e!57700))))

(declare-fun thiss!1152 () BitStream!3272)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!86925 (= res!71448 (invariant!0 (currentBit!4455 thiss!1152) (currentByte!4460 thiss!1152) (size!1855 (buf!2245 thiss!1152))))))

(declare-fun b!86926 () Bool)

(declare-fun res!71451 () Bool)

(declare-fun e!57697 () Bool)

(assert (=> b!86926 (=> res!71451 e!57697)))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!86926 (= res!71451 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!86927 () Bool)

(declare-fun res!71463 () Bool)

(declare-fun e!57703 () Bool)

(assert (=> b!86927 (=> (not res!71463) (not e!57703))))

(assert (=> b!86927 (= res!71463 (bvslt i!576 nBits!336))))

(declare-fun b!86928 () Bool)

(declare-fun res!71457 () Bool)

(assert (=> b!86928 (=> (not res!71457) (not e!57700))))

(declare-fun thiss!1151 () BitStream!3272)

(assert (=> b!86928 (= res!71457 (invariant!0 (currentBit!4455 thiss!1151) (currentByte!4460 thiss!1151) (size!1855 (buf!2245 thiss!1151))))))

(declare-fun b!86929 () Bool)

(assert (=> b!86929 (= e!57700 e!57703)))

(declare-fun res!71462 () Bool)

(assert (=> b!86929 (=> (not res!71462) (not e!57703))))

(declare-fun lt!135452 () (_ BitVec 64))

(assert (=> b!86929 (= res!71462 (= lt!135451 (bvadd lt!135452 ((_ sign_extend 32) i!576))))))

(assert (=> b!86929 (= lt!135451 (bitIndex!0 (size!1855 (buf!2245 thiss!1152)) (currentByte!4460 thiss!1152) (currentBit!4455 thiss!1152)))))

(assert (=> b!86929 (= lt!135452 (bitIndex!0 (size!1855 (buf!2245 thiss!1151)) (currentByte!4460 thiss!1151) (currentBit!4455 thiss!1151)))))

(declare-fun b!86930 () Bool)

(declare-fun e!57699 () Bool)

(declare-datatypes ((tuple3!410 0))(
  ( (tuple3!411 (_1!3908 Unit!5729) (_2!3908 BitStream!3272) (_3!229 (_ BitVec 32))) )
))
(declare-fun lt!135453 () tuple3!410)

(assert (=> b!86930 (= e!57699 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4455 (_2!3908 lt!135453)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4460 (_2!3908 lt!135453)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1855 (buf!2245 (_2!3908 lt!135453)))))))))

(declare-fun b!86931 () Bool)

(declare-fun res!71464 () Bool)

(assert (=> b!86931 (=> res!71464 e!57699)))

(assert (=> b!86931 (= res!71464 (or (bvsgt (_3!229 lt!135453) nBits!336) (not (= (size!1855 (buf!2245 (_2!3908 lt!135453))) (size!1855 (buf!2245 thiss!1151))))))))

(declare-fun b!86932 () Bool)

(declare-fun res!71459 () Bool)

(assert (=> b!86932 (=> res!71459 e!57699)))

(assert (=> b!86932 (= res!71459 (not (invariant!0 (currentBit!4455 (_2!3908 lt!135453)) (currentByte!4460 (_2!3908 lt!135453)) (size!1855 (buf!2245 (_2!3908 lt!135453))))))))

(declare-fun b!86933 () Bool)

(declare-fun res!71458 () Bool)

(assert (=> b!86933 (=> res!71458 e!57699)))

(assert (=> b!86933 (= res!71458 (or (bvsgt ((_ sign_extend 32) (size!1855 (buf!2245 (_2!3908 lt!135453)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4460 (_2!3908 lt!135453))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4455 (_2!3908 lt!135453))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1855 (buf!2245 (_2!3908 lt!135453)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4460 (_2!3908 lt!135453))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4455 (_2!3908 lt!135453))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86934 () Bool)

(declare-fun e!57705 () Bool)

(declare-datatypes ((tuple2!7358 0))(
  ( (tuple2!7359 (_1!3909 BitStream!3272) (_2!3909 Bool)) )
))
(declare-fun lt!135455 () tuple2!7358)

(assert (=> b!86934 (= e!57705 (= (bitIndex!0 (size!1855 (buf!2245 (_1!3909 lt!135455))) (currentByte!4460 (_1!3909 lt!135455)) (currentBit!4455 (_1!3909 lt!135455))) lt!135454))))

(declare-fun b!86935 () Bool)

(declare-fun res!71466 () Bool)

(assert (=> b!86935 (=> (not res!71466) (not e!57702))))

(declare-fun isPrefixOf!0 (BitStream!3272 BitStream!3272) Bool)

(assert (=> b!86935 (= res!71466 (isPrefixOf!0 thiss!1152 (_2!3907 lt!135456)))))

(declare-fun b!86936 () Bool)

(assert (=> b!86936 (= e!57703 (not e!57697))))

(declare-fun res!71456 () Bool)

(assert (=> b!86936 (=> res!71456 e!57697)))

(assert (=> b!86936 (= res!71456 (not (invariant!0 (currentBit!4455 (_2!3907 lt!135456)) (currentByte!4460 (_2!3907 lt!135456)) (size!1855 (buf!2245 (_2!3907 lt!135456))))))))

(assert (=> b!86936 e!57698))

(declare-fun res!71467 () Bool)

(assert (=> b!86936 (=> (not res!71467) (not e!57698))))

(assert (=> b!86936 (= res!71467 (= (size!1855 (buf!2245 thiss!1152)) (size!1855 (buf!2245 (_2!3907 lt!135456)))))))

(declare-fun lt!135450 () Bool)

(declare-fun appendBit!0 (BitStream!3272 Bool) tuple2!7356)

(assert (=> b!86936 (= lt!135456 (appendBit!0 thiss!1152 lt!135450))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!86936 (= lt!135450 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!86937 () Bool)

(declare-fun res!71450 () Bool)

(assert (=> b!86937 (=> (not res!71450) (not e!57700))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!86937 (= res!71450 (validate_offset_bits!1 ((_ sign_extend 32) (size!1855 (buf!2245 thiss!1151))) ((_ sign_extend 32) (currentByte!4460 thiss!1151)) ((_ sign_extend 32) (currentBit!4455 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!86938 () Bool)

(declare-fun e!57695 () Bool)

(declare-fun array_inv!1701 (array!4108) Bool)

(assert (=> b!86938 (= e!57695 (array_inv!1701 (buf!2245 thiss!1151)))))

(declare-fun b!86939 () Bool)

(declare-fun res!71461 () Bool)

(assert (=> b!86939 (=> res!71461 e!57699)))

(assert (=> b!86939 (= res!71461 (not (= (bitIndex!0 (size!1855 (buf!2245 (_2!3908 lt!135453))) (currentByte!4460 (_2!3908 lt!135453)) (currentBit!4455 (_2!3908 lt!135453))) (bvadd lt!135452 ((_ sign_extend 32) (_3!229 lt!135453))))))))

(declare-fun b!86940 () Bool)

(declare-fun res!71465 () Bool)

(assert (=> b!86940 (=> (not res!71465) (not e!57700))))

(assert (=> b!86940 (= res!71465 (and (bvsle i!576 nBits!336) (= (size!1855 (buf!2245 thiss!1152)) (size!1855 (buf!2245 thiss!1151)))))))

(declare-fun b!86941 () Bool)

(declare-fun e!57696 () Bool)

(assert (=> b!86941 (= e!57696 (array_inv!1701 (buf!2245 thiss!1152)))))

(declare-fun b!86942 () Bool)

(assert (=> b!86942 (= e!57702 e!57705)))

(declare-fun res!71452 () Bool)

(assert (=> b!86942 (=> (not res!71452) (not e!57705))))

(assert (=> b!86942 (= res!71452 (and (= (_2!3909 lt!135455) lt!135450) (= (_1!3909 lt!135455) (_2!3907 lt!135456))))))

(declare-fun readBitPure!0 (BitStream!3272) tuple2!7358)

(declare-fun readerFrom!0 (BitStream!3272 (_ BitVec 32) (_ BitVec 32)) BitStream!3272)

(assert (=> b!86942 (= lt!135455 (readBitPure!0 (readerFrom!0 (_2!3907 lt!135456) (currentBit!4455 thiss!1152) (currentByte!4460 thiss!1152))))))

(declare-fun res!71454 () Bool)

(assert (=> start!17840 (=> (not res!71454) (not e!57700))))

(assert (=> start!17840 (= res!71454 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17840 e!57700))

(declare-fun inv!12 (BitStream!3272) Bool)

(assert (=> start!17840 (and (inv!12 thiss!1152) e!57696)))

(assert (=> start!17840 (and (inv!12 thiss!1151) e!57695)))

(assert (=> start!17840 true))

(declare-fun b!86943 () Bool)

(declare-fun res!71460 () Bool)

(assert (=> b!86943 (=> (not res!71460) (not e!57703))))

(assert (=> b!86943 (= res!71460 (validate_offset_bits!1 ((_ sign_extend 32) (size!1855 (buf!2245 thiss!1152))) ((_ sign_extend 32) (currentByte!4460 thiss!1152)) ((_ sign_extend 32) (currentBit!4455 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!86944 () Bool)

(assert (=> b!86944 (= e!57697 e!57699)))

(declare-fun res!71449 () Bool)

(assert (=> b!86944 (=> res!71449 e!57699)))

(assert (=> b!86944 (= res!71449 (bvslt (_3!229 lt!135453) #b00000000000000000000000000000000))))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3272 (_ BitVec 64) BitStream!3272 (_ BitVec 32)) tuple3!410)

(assert (=> b!86944 (= lt!135453 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3907 lt!135456) (bvadd #b00000000000000000000000000000001 i!576)))))

(assert (= (and start!17840 res!71454) b!86937))

(assert (= (and b!86937 res!71450) b!86928))

(assert (= (and b!86928 res!71457) b!86924))

(assert (= (and b!86924 res!71453) b!86925))

(assert (= (and b!86925 res!71448) b!86940))

(assert (= (and b!86940 res!71465) b!86929))

(assert (= (and b!86929 res!71462) b!86943))

(assert (= (and b!86943 res!71460) b!86927))

(assert (= (and b!86927 res!71463) b!86936))

(assert (= (and b!86936 res!71467) b!86923))

(assert (= (and b!86923 res!71455) b!86935))

(assert (= (and b!86935 res!71466) b!86942))

(assert (= (and b!86942 res!71452) b!86934))

(assert (= (and b!86936 (not res!71456)) b!86926))

(assert (= (and b!86926 (not res!71451)) b!86944))

(assert (= (and b!86944 (not res!71449)) b!86932))

(assert (= (and b!86932 (not res!71459)) b!86931))

(assert (= (and b!86931 (not res!71464)) b!86939))

(assert (= (and b!86939 (not res!71461)) b!86933))

(assert (= (and b!86933 (not res!71458)) b!86930))

(assert (= start!17840 b!86941))

(assert (= start!17840 b!86938))

(declare-fun m!132575 () Bool)

(assert (=> b!86941 m!132575))

(declare-fun m!132577 () Bool)

(assert (=> b!86936 m!132577))

(declare-fun m!132579 () Bool)

(assert (=> b!86936 m!132579))

(declare-fun m!132581 () Bool)

(assert (=> b!86923 m!132581))

(declare-fun m!132583 () Bool)

(assert (=> b!86930 m!132583))

(declare-fun m!132585 () Bool)

(assert (=> b!86932 m!132585))

(declare-fun m!132587 () Bool)

(assert (=> b!86934 m!132587))

(declare-fun m!132589 () Bool)

(assert (=> b!86928 m!132589))

(declare-fun m!132591 () Bool)

(assert (=> b!86925 m!132591))

(declare-fun m!132593 () Bool)

(assert (=> b!86943 m!132593))

(declare-fun m!132595 () Bool)

(assert (=> b!86944 m!132595))

(declare-fun m!132597 () Bool)

(assert (=> b!86939 m!132597))

(declare-fun m!132599 () Bool)

(assert (=> b!86937 m!132599))

(declare-fun m!132601 () Bool)

(assert (=> b!86938 m!132601))

(declare-fun m!132603 () Bool)

(assert (=> b!86929 m!132603))

(declare-fun m!132605 () Bool)

(assert (=> b!86929 m!132605))

(declare-fun m!132607 () Bool)

(assert (=> b!86942 m!132607))

(assert (=> b!86942 m!132607))

(declare-fun m!132609 () Bool)

(assert (=> b!86942 m!132609))

(declare-fun m!132611 () Bool)

(assert (=> b!86935 m!132611))

(declare-fun m!132613 () Bool)

(assert (=> start!17840 m!132613))

(declare-fun m!132615 () Bool)

(assert (=> start!17840 m!132615))

(push 1)

(assert (not b!86932))

(assert (not b!86936))

(assert (not b!86938))

(assert (not start!17840))

(assert (not b!86934))

(assert (not b!86937))

(assert (not b!86928))

(assert (not b!86929))

(assert (not b!86943))

(assert (not b!86944))

(assert (not b!86941))

(assert (not b!86942))

(assert (not b!86925))

(assert (not b!86935))

(assert (not b!86923))

(assert (not b!86939))

(assert (not b!86930))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

