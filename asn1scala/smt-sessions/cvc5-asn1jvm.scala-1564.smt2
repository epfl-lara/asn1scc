; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43974 () Bool)

(assert start!43974)

(declare-fun b!209491 () Bool)

(declare-fun e!143008 () Bool)

(declare-fun e!143007 () Bool)

(assert (=> b!209491 (= e!143008 e!143007)))

(declare-fun res!175867 () Bool)

(assert (=> b!209491 (=> (not res!175867) (not e!143007))))

(declare-fun lt!327983 () (_ BitVec 64))

(declare-fun lt!327974 () (_ BitVec 64))

(assert (=> b!209491 (= res!175867 (= lt!327983 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327974)))))

(declare-datatypes ((array!10472 0))(
  ( (array!10473 (arr!5533 (Array (_ BitVec 32) (_ BitVec 8))) (size!4603 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8314 0))(
  ( (BitStream!8315 (buf!5117 array!10472) (currentByte!9653 (_ BitVec 32)) (currentBit!9648 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14917 0))(
  ( (Unit!14918) )
))
(declare-datatypes ((tuple2!17966 0))(
  ( (tuple2!17967 (_1!9638 Unit!14917) (_2!9638 BitStream!8314)) )
))
(declare-fun lt!327996 () tuple2!17966)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209491 (= lt!327983 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))))))

(declare-fun thiss!1204 () BitStream!8314)

(assert (=> b!209491 (= lt!327974 (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(declare-fun b!209492 () Bool)

(declare-fun e!143009 () Bool)

(declare-fun array_inv!4344 (array!10472) Bool)

(assert (=> b!209492 (= e!143009 (array_inv!4344 (buf!5117 thiss!1204)))))

(declare-fun b!209493 () Bool)

(declare-fun e!143010 () Bool)

(assert (=> b!209493 (= e!143007 e!143010)))

(declare-fun res!175869 () Bool)

(assert (=> b!209493 (=> (not res!175869) (not e!143010))))

(declare-fun lt!327986 () Bool)

(declare-datatypes ((tuple2!17968 0))(
  ( (tuple2!17969 (_1!9639 BitStream!8314) (_2!9639 Bool)) )
))
(declare-fun lt!327973 () tuple2!17968)

(assert (=> b!209493 (= res!175869 (and (= (_2!9639 lt!327973) lt!327986) (= (_1!9639 lt!327973) (_2!9638 lt!327996))))))

(declare-fun readBitPure!0 (BitStream!8314) tuple2!17968)

(declare-fun readerFrom!0 (BitStream!8314 (_ BitVec 32) (_ BitVec 32)) BitStream!8314)

(assert (=> b!209493 (= lt!327973 (readBitPure!0 (readerFrom!0 (_2!9638 lt!327996) (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204))))))

(declare-fun b!209494 () Bool)

(declare-fun e!143000 () Bool)

(declare-fun e!143005 () Bool)

(assert (=> b!209494 (= e!143000 e!143005)))

(declare-fun res!175871 () Bool)

(assert (=> b!209494 (=> (not res!175871) (not e!143005))))

(declare-fun lt!327976 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209494 (= res!175871 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 thiss!1204))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204)) lt!327976))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!209494 (= lt!327976 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!209495 () Bool)

(declare-fun e!143003 () Bool)

(declare-fun lt!327997 () tuple2!17968)

(declare-fun lt!327985 () tuple2!17968)

(assert (=> b!209495 (= e!143003 (= (_2!9639 lt!327997) (_2!9639 lt!327985)))))

(declare-fun b!209496 () Bool)

(assert (=> b!209496 (= e!143010 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!327973))) (currentByte!9653 (_1!9639 lt!327973)) (currentBit!9648 (_1!9639 lt!327973))) lt!327983))))

(declare-fun b!209497 () Bool)

(declare-fun e!143002 () Bool)

(assert (=> b!209497 (= e!143005 (not e!143002))))

(declare-fun res!175874 () Bool)

(assert (=> b!209497 (=> res!175874 e!143002)))

(declare-fun lt!327984 () (_ BitVec 64))

(declare-fun lt!327990 () (_ BitVec 64))

(assert (=> b!209497 (= res!175874 (not (= lt!327984 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!327990))))))

(assert (=> b!209497 (= lt!327984 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))))))

(assert (=> b!209497 (= lt!327990 (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(assert (=> b!209497 e!143008))

(declare-fun res!175862 () Bool)

(assert (=> b!209497 (=> (not res!175862) (not e!143008))))

(assert (=> b!209497 (= res!175862 (= (size!4603 (buf!5117 thiss!1204)) (size!4603 (buf!5117 (_2!9638 lt!327996)))))))

(declare-fun appendBit!0 (BitStream!8314 Bool) tuple2!17966)

(assert (=> b!209497 (= lt!327996 (appendBit!0 thiss!1204 lt!327986))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!327975 () (_ BitVec 64))

(assert (=> b!209497 (= lt!327986 (not (= (bvand v!189 lt!327975) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209497 (= lt!327975 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!209498 () Bool)

(declare-fun res!175868 () Bool)

(declare-fun e!143004 () Bool)

(assert (=> b!209498 (=> res!175868 e!143004)))

(declare-fun lt!327988 () (_ BitVec 64))

(declare-fun lt!327987 () tuple2!17966)

(assert (=> b!209498 (= res!175868 (or (not (= (size!4603 (buf!5117 (_2!9638 lt!327987))) (size!4603 (buf!5117 thiss!1204)))) (not (= lt!327988 (bvsub (bvadd lt!327990 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!209499 () Bool)

(declare-fun e!143001 () Bool)

(assert (=> b!209499 (= e!143004 e!143001)))

(declare-fun res!175872 () Bool)

(assert (=> b!209499 (=> res!175872 e!143001)))

(declare-fun lt!327981 () (_ BitVec 64))

(declare-datatypes ((tuple2!17970 0))(
  ( (tuple2!17971 (_1!9640 BitStream!8314) (_2!9640 BitStream!8314)) )
))
(declare-fun lt!327972 () tuple2!17970)

(declare-datatypes ((tuple2!17972 0))(
  ( (tuple2!17973 (_1!9641 BitStream!8314) (_2!9641 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17972)

(assert (=> b!209499 (= res!175872 (not (= (_1!9641 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!327972) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327981)) (_2!9640 lt!327972))))))

(declare-fun lt!327993 () (_ BitVec 64))

(assert (=> b!209499 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996))) lt!327993)))

(declare-fun lt!327982 () Unit!14917)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8314 array!10472 (_ BitVec 64)) Unit!14917)

(assert (=> b!209499 (= lt!327982 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9638 lt!327996) (buf!5117 (_2!9638 lt!327987)) lt!327993))))

(assert (=> b!209499 (= lt!327993 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!327971 () tuple2!17968)

(declare-fun lt!327998 () (_ BitVec 64))

(assert (=> b!209499 (= lt!327981 (bvor lt!327998 (ite (_2!9639 lt!327971) lt!327975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!327980 () tuple2!17972)

(declare-fun lt!327994 () tuple2!17970)

(assert (=> b!209499 (= lt!327980 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!327994) nBits!348 i!590 lt!327998))))

(assert (=> b!209499 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204)) lt!327976)))

(declare-fun lt!327995 () Unit!14917)

(assert (=> b!209499 (= lt!327995 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5117 (_2!9638 lt!327987)) lt!327976))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!209499 (= lt!327998 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!209499 (= (_2!9639 lt!327971) lt!327986)))

(assert (=> b!209499 (= lt!327971 (readBitPure!0 (_1!9640 lt!327994)))))

(declare-fun reader!0 (BitStream!8314 BitStream!8314) tuple2!17970)

(assert (=> b!209499 (= lt!327972 (reader!0 (_2!9638 lt!327996) (_2!9638 lt!327987)))))

(assert (=> b!209499 (= lt!327994 (reader!0 thiss!1204 (_2!9638 lt!327987)))))

(assert (=> b!209499 e!143003))

(declare-fun res!175870 () Bool)

(assert (=> b!209499 (=> (not res!175870) (not e!143003))))

(assert (=> b!209499 (= res!175870 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!327997))) (currentByte!9653 (_1!9639 lt!327997)) (currentBit!9648 (_1!9639 lt!327997))) (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!327985))) (currentByte!9653 (_1!9639 lt!327985)) (currentBit!9648 (_1!9639 lt!327985)))))))

(declare-fun lt!327979 () Unit!14917)

(declare-fun lt!327978 () BitStream!8314)

(declare-fun readBitPrefixLemma!0 (BitStream!8314 BitStream!8314) Unit!14917)

(assert (=> b!209499 (= lt!327979 (readBitPrefixLemma!0 lt!327978 (_2!9638 lt!327987)))))

(assert (=> b!209499 (= lt!327985 (readBitPure!0 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204))))))

(assert (=> b!209499 (= lt!327997 (readBitPure!0 lt!327978))))

(declare-fun e!143006 () Bool)

(assert (=> b!209499 e!143006))

(declare-fun res!175858 () Bool)

(assert (=> b!209499 (=> (not res!175858) (not e!143006))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!209499 (= res!175858 (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327996)))))))

(assert (=> b!209499 (= lt!327978 (BitStream!8315 (buf!5117 (_2!9638 lt!327996)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(declare-fun b!209500 () Bool)

(declare-fun res!175861 () Bool)

(assert (=> b!209500 (=> (not res!175861) (not e!143005))))

(assert (=> b!209500 (= res!175861 (not (= i!590 nBits!348)))))

(declare-fun b!209501 () Bool)

(declare-fun res!175865 () Bool)

(assert (=> b!209501 (=> (not res!175865) (not e!143005))))

(assert (=> b!209501 (= res!175865 (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 thiss!1204))))))

(declare-fun lt!327992 () (_ BitVec 64))

(declare-fun b!209502 () Bool)

(assert (=> b!209502 (= e!143001 (or (= lt!327992 (bvand lt!327988 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!327992 (bvand (bvsub lt!327990 lt!327988) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!209502 (= lt!327992 (bvand lt!327990 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!327989 () tuple2!17972)

(assert (=> b!209502 (and (= (_2!9641 lt!327980) (_2!9641 lt!327989)) (= (_1!9641 lt!327980) (_1!9641 lt!327989)))))

(declare-fun lt!327977 () Unit!14917)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14917)

(assert (=> b!209502 (= lt!327977 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9640 lt!327994) nBits!348 i!590 lt!327998))))

(declare-fun withMovedBitIndex!0 (BitStream!8314 (_ BitVec 64)) BitStream!8314)

(assert (=> b!209502 (= lt!327989 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9640 lt!327994) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327981))))

(declare-fun b!209503 () Bool)

(declare-fun res!175859 () Bool)

(assert (=> b!209503 (=> (not res!175859) (not e!143007))))

(declare-fun isPrefixOf!0 (BitStream!8314 BitStream!8314) Bool)

(assert (=> b!209503 (= res!175859 (isPrefixOf!0 thiss!1204 (_2!9638 lt!327996)))))

(declare-fun res!175866 () Bool)

(assert (=> start!43974 (=> (not res!175866) (not e!143000))))

(assert (=> start!43974 (= res!175866 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43974 e!143000))

(assert (=> start!43974 true))

(declare-fun inv!12 (BitStream!8314) Bool)

(assert (=> start!43974 (and (inv!12 thiss!1204) e!143009)))

(declare-fun b!209504 () Bool)

(declare-fun res!175863 () Bool)

(assert (=> b!209504 (=> res!175863 e!143004)))

(assert (=> b!209504 (= res!175863 (not (invariant!0 (currentBit!9648 (_2!9638 lt!327987)) (currentByte!9653 (_2!9638 lt!327987)) (size!4603 (buf!5117 (_2!9638 lt!327987))))))))

(declare-fun b!209505 () Bool)

(assert (=> b!209505 (= e!143002 e!143004)))

(declare-fun res!175873 () Bool)

(assert (=> b!209505 (=> res!175873 e!143004)))

(assert (=> b!209505 (= res!175873 (not (= lt!327988 (bvsub (bvsub (bvadd lt!327984 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!209505 (= lt!327988 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327987))) (currentByte!9653 (_2!9638 lt!327987)) (currentBit!9648 (_2!9638 lt!327987))))))

(assert (=> b!209505 (isPrefixOf!0 thiss!1204 (_2!9638 lt!327987))))

(declare-fun lt!327991 () Unit!14917)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8314 BitStream!8314 BitStream!8314) Unit!14917)

(assert (=> b!209505 (= lt!327991 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9638 lt!327996) (_2!9638 lt!327987)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8314 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17966)

(assert (=> b!209505 (= lt!327987 (appendBitsLSBFirstLoopTR!0 (_2!9638 lt!327996) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!209506 () Bool)

(assert (=> b!209506 (= e!143006 (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327987)))))))

(declare-fun b!209507 () Bool)

(declare-fun res!175864 () Bool)

(assert (=> b!209507 (=> res!175864 e!143004)))

(assert (=> b!209507 (= res!175864 (not (isPrefixOf!0 thiss!1204 (_2!9638 lt!327996))))))

(declare-fun b!209508 () Bool)

(declare-fun res!175860 () Bool)

(assert (=> b!209508 (=> res!175860 e!143004)))

(assert (=> b!209508 (= res!175860 (not (isPrefixOf!0 (_2!9638 lt!327996) (_2!9638 lt!327987))))))

(assert (= (and start!43974 res!175866) b!209494))

(assert (= (and b!209494 res!175871) b!209501))

(assert (= (and b!209501 res!175865) b!209500))

(assert (= (and b!209500 res!175861) b!209497))

(assert (= (and b!209497 res!175862) b!209491))

(assert (= (and b!209491 res!175867) b!209503))

(assert (= (and b!209503 res!175859) b!209493))

(assert (= (and b!209493 res!175869) b!209496))

(assert (= (and b!209497 (not res!175874)) b!209505))

(assert (= (and b!209505 (not res!175873)) b!209504))

(assert (= (and b!209504 (not res!175863)) b!209498))

(assert (= (and b!209498 (not res!175868)) b!209508))

(assert (= (and b!209508 (not res!175860)) b!209507))

(assert (= (and b!209507 (not res!175864)) b!209499))

(assert (= (and b!209499 res!175858) b!209506))

(assert (= (and b!209499 res!175870) b!209495))

(assert (= (and b!209499 (not res!175872)) b!209502))

(assert (= start!43974 b!209492))

(declare-fun m!322359 () Bool)

(assert (=> b!209496 m!322359))

(declare-fun m!322361 () Bool)

(assert (=> b!209499 m!322361))

(declare-fun m!322363 () Bool)

(assert (=> b!209499 m!322363))

(declare-fun m!322365 () Bool)

(assert (=> b!209499 m!322365))

(declare-fun m!322367 () Bool)

(assert (=> b!209499 m!322367))

(declare-fun m!322369 () Bool)

(assert (=> b!209499 m!322369))

(declare-fun m!322371 () Bool)

(assert (=> b!209499 m!322371))

(declare-fun m!322373 () Bool)

(assert (=> b!209499 m!322373))

(declare-fun m!322375 () Bool)

(assert (=> b!209499 m!322375))

(declare-fun m!322377 () Bool)

(assert (=> b!209499 m!322377))

(declare-fun m!322379 () Bool)

(assert (=> b!209499 m!322379))

(declare-fun m!322381 () Bool)

(assert (=> b!209499 m!322381))

(declare-fun m!322383 () Bool)

(assert (=> b!209499 m!322383))

(declare-fun m!322385 () Bool)

(assert (=> b!209499 m!322385))

(declare-fun m!322387 () Bool)

(assert (=> b!209499 m!322387))

(declare-fun m!322389 () Bool)

(assert (=> b!209499 m!322389))

(declare-fun m!322391 () Bool)

(assert (=> b!209499 m!322391))

(declare-fun m!322393 () Bool)

(assert (=> b!209508 m!322393))

(declare-fun m!322395 () Bool)

(assert (=> b!209493 m!322395))

(assert (=> b!209493 m!322395))

(declare-fun m!322397 () Bool)

(assert (=> b!209493 m!322397))

(declare-fun m!322399 () Bool)

(assert (=> b!209492 m!322399))

(declare-fun m!322401 () Bool)

(assert (=> b!209494 m!322401))

(declare-fun m!322403 () Bool)

(assert (=> start!43974 m!322403))

(declare-fun m!322405 () Bool)

(assert (=> b!209507 m!322405))

(declare-fun m!322407 () Bool)

(assert (=> b!209505 m!322407))

(declare-fun m!322409 () Bool)

(assert (=> b!209505 m!322409))

(declare-fun m!322411 () Bool)

(assert (=> b!209505 m!322411))

(declare-fun m!322413 () Bool)

(assert (=> b!209505 m!322413))

(declare-fun m!322415 () Bool)

(assert (=> b!209491 m!322415))

(declare-fun m!322417 () Bool)

(assert (=> b!209491 m!322417))

(declare-fun m!322419 () Bool)

(assert (=> b!209506 m!322419))

(assert (=> b!209497 m!322415))

(assert (=> b!209497 m!322417))

(declare-fun m!322421 () Bool)

(assert (=> b!209497 m!322421))

(assert (=> b!209503 m!322405))

(declare-fun m!322423 () Bool)

(assert (=> b!209504 m!322423))

(declare-fun m!322425 () Bool)

(assert (=> b!209501 m!322425))

(declare-fun m!322427 () Bool)

(assert (=> b!209502 m!322427))

(declare-fun m!322429 () Bool)

(assert (=> b!209502 m!322429))

(assert (=> b!209502 m!322429))

(declare-fun m!322431 () Bool)

(assert (=> b!209502 m!322431))

(push 1)

(assert (not b!209493))

(assert (not b!209499))

(assert (not b!209494))

(assert (not b!209496))

(assert (not b!209505))

(assert (not b!209491))

(assert (not b!209497))

(assert (not b!209504))

(assert (not b!209492))

(assert (not b!209501))

(assert (not b!209507))

(assert (not start!43974))

(assert (not b!209506))

(assert (not b!209508))

(assert (not b!209503))

(assert (not b!209502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70803 () Bool)

(declare-fun e!143085 () Bool)

(assert (=> d!70803 e!143085))

(declare-fun res!175982 () Bool)

(assert (=> d!70803 (=> (not res!175982) (not e!143085))))

(declare-fun lt!328179 () (_ BitVec 64))

(declare-fun lt!328184 () (_ BitVec 64))

(declare-fun lt!328182 () (_ BitVec 64))

(assert (=> d!70803 (= res!175982 (= lt!328179 (bvsub lt!328184 lt!328182)))))

(assert (=> d!70803 (or (= (bvand lt!328184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328184 lt!328182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70803 (= lt!328182 (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327996)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996)))))))

(declare-fun lt!328180 () (_ BitVec 64))

(declare-fun lt!328183 () (_ BitVec 64))

(assert (=> d!70803 (= lt!328184 (bvmul lt!328180 lt!328183))))

(assert (=> d!70803 (or (= lt!328180 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328183 (bvsdiv (bvmul lt!328180 lt!328183) lt!328180)))))

(assert (=> d!70803 (= lt!328183 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70803 (= lt!328180 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327996)))))))

(assert (=> d!70803 (= lt!328179 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996)))))))

(assert (=> d!70803 (invariant!0 (currentBit!9648 (_2!9638 lt!327996)) (currentByte!9653 (_2!9638 lt!327996)) (size!4603 (buf!5117 (_2!9638 lt!327996))))))

(assert (=> d!70803 (= (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))) lt!328179)))

(declare-fun b!209621 () Bool)

(declare-fun res!175981 () Bool)

(assert (=> b!209621 (=> (not res!175981) (not e!143085))))

(assert (=> b!209621 (= res!175981 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328179))))

(declare-fun b!209622 () Bool)

(declare-fun lt!328181 () (_ BitVec 64))

(assert (=> b!209622 (= e!143085 (bvsle lt!328179 (bvmul lt!328181 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209622 (or (= lt!328181 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328181 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328181)))))

(assert (=> b!209622 (= lt!328181 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327996)))))))

(assert (= (and d!70803 res!175982) b!209621))

(assert (= (and b!209621 res!175981) b!209622))

(declare-fun m!322581 () Bool)

(assert (=> d!70803 m!322581))

(declare-fun m!322583 () Bool)

(assert (=> d!70803 m!322583))

(assert (=> b!209491 d!70803))

(declare-fun d!70805 () Bool)

(declare-fun e!143086 () Bool)

(assert (=> d!70805 e!143086))

(declare-fun res!175984 () Bool)

(assert (=> d!70805 (=> (not res!175984) (not e!143086))))

(declare-fun lt!328185 () (_ BitVec 64))

(declare-fun lt!328190 () (_ BitVec 64))

(declare-fun lt!328188 () (_ BitVec 64))

(assert (=> d!70805 (= res!175984 (= lt!328185 (bvsub lt!328190 lt!328188)))))

(assert (=> d!70805 (or (= (bvand lt!328190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328190 lt!328188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70805 (= lt!328188 (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 thiss!1204))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204))))))

(declare-fun lt!328186 () (_ BitVec 64))

(declare-fun lt!328189 () (_ BitVec 64))

(assert (=> d!70805 (= lt!328190 (bvmul lt!328186 lt!328189))))

(assert (=> d!70805 (or (= lt!328186 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328189 (bvsdiv (bvmul lt!328186 lt!328189) lt!328186)))))

(assert (=> d!70805 (= lt!328189 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70805 (= lt!328186 ((_ sign_extend 32) (size!4603 (buf!5117 thiss!1204))))))

(assert (=> d!70805 (= lt!328185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9653 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9648 thiss!1204))))))

(assert (=> d!70805 (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 thiss!1204)))))

(assert (=> d!70805 (= (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)) lt!328185)))

(declare-fun b!209623 () Bool)

(declare-fun res!175983 () Bool)

(assert (=> b!209623 (=> (not res!175983) (not e!143086))))

(assert (=> b!209623 (= res!175983 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328185))))

(declare-fun b!209624 () Bool)

(declare-fun lt!328187 () (_ BitVec 64))

(assert (=> b!209624 (= e!143086 (bvsle lt!328185 (bvmul lt!328187 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209624 (or (= lt!328187 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328187 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328187)))))

(assert (=> b!209624 (= lt!328187 ((_ sign_extend 32) (size!4603 (buf!5117 thiss!1204))))))

(assert (= (and d!70805 res!175984) b!209623))

(assert (= (and b!209623 res!175983) b!209624))

(declare-fun m!322585 () Bool)

(assert (=> d!70805 m!322585))

(assert (=> d!70805 m!322425))

(assert (=> b!209491 d!70805))

(declare-fun d!70807 () Bool)

(assert (=> d!70807 (= (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 thiss!1204))) (and (bvsge (currentBit!9648 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9648 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9653 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9653 thiss!1204) (size!4603 (buf!5117 thiss!1204))) (and (= (currentBit!9648 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9653 thiss!1204) (size!4603 (buf!5117 thiss!1204)))))))))

(assert (=> b!209501 d!70807))

(declare-fun d!70809 () Bool)

(assert (=> d!70809 (= (array_inv!4344 (buf!5117 thiss!1204)) (bvsge (size!4603 (buf!5117 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!209492 d!70809))

(declare-fun d!70811 () Bool)

(declare-fun res!175992 () Bool)

(declare-fun e!143091 () Bool)

(assert (=> d!70811 (=> (not res!175992) (not e!143091))))

(assert (=> d!70811 (= res!175992 (= (size!4603 (buf!5117 thiss!1204)) (size!4603 (buf!5117 (_2!9638 lt!327996)))))))

(assert (=> d!70811 (= (isPrefixOf!0 thiss!1204 (_2!9638 lt!327996)) e!143091)))

(declare-fun b!209631 () Bool)

(declare-fun res!175991 () Bool)

(assert (=> b!209631 (=> (not res!175991) (not e!143091))))

(assert (=> b!209631 (= res!175991 (bvsle (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)) (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996)))))))

(declare-fun b!209632 () Bool)

(declare-fun e!143092 () Bool)

(assert (=> b!209632 (= e!143091 e!143092)))

(declare-fun res!175993 () Bool)

(assert (=> b!209632 (=> res!175993 e!143092)))

(assert (=> b!209632 (= res!175993 (= (size!4603 (buf!5117 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209633 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10472 array!10472 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209633 (= e!143092 (arrayBitRangesEq!0 (buf!5117 thiss!1204) (buf!5117 (_2!9638 lt!327996)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204))))))

(assert (= (and d!70811 res!175992) b!209631))

(assert (= (and b!209631 res!175991) b!209632))

(assert (= (and b!209632 (not res!175993)) b!209633))

(assert (=> b!209631 m!322417))

(assert (=> b!209631 m!322415))

(assert (=> b!209633 m!322417))

(assert (=> b!209633 m!322417))

(declare-fun m!322587 () Bool)

(assert (=> b!209633 m!322587))

(assert (=> b!209503 d!70811))

(declare-fun d!70813 () Bool)

(declare-fun lt!328206 () tuple2!17972)

(declare-fun lt!328208 () tuple2!17972)

(assert (=> d!70813 (and (= (_2!9641 lt!328206) (_2!9641 lt!328208)) (= (_1!9641 lt!328206) (_1!9641 lt!328208)))))

(declare-fun lt!328207 () (_ BitVec 64))

(declare-fun lt!328204 () Bool)

(declare-fun lt!328205 () Unit!14917)

(declare-fun lt!328203 () BitStream!8314)

(declare-fun choose!56 (BitStream!8314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!17972 tuple2!17972 BitStream!8314 (_ BitVec 64) Bool BitStream!8314 (_ BitVec 64) tuple2!17972 tuple2!17972 BitStream!8314 (_ BitVec 64)) Unit!14917)

(assert (=> d!70813 (= lt!328205 (choose!56 (_1!9640 lt!327994) nBits!348 i!590 lt!327998 lt!328206 (tuple2!17973 (_1!9641 lt!328206) (_2!9641 lt!328206)) (_1!9641 lt!328206) (_2!9641 lt!328206) lt!328204 lt!328203 lt!328207 lt!328208 (tuple2!17973 (_1!9641 lt!328208) (_2!9641 lt!328208)) (_1!9641 lt!328208) (_2!9641 lt!328208)))))

(assert (=> d!70813 (= lt!328208 (readNBitsLSBFirstsLoopPure!0 lt!328203 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!328207))))

(assert (=> d!70813 (= lt!328207 (bvor lt!327998 (ite lt!328204 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70813 (= lt!328203 (withMovedBitIndex!0 (_1!9640 lt!327994) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!70813 (= lt!328204 (_2!9639 (readBitPure!0 (_1!9640 lt!327994))))))

(assert (=> d!70813 (= lt!328206 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!327994) nBits!348 i!590 lt!327998))))

(assert (=> d!70813 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9640 lt!327994) nBits!348 i!590 lt!327998) lt!328205)))

(declare-fun bs!17398 () Bool)

(assert (= bs!17398 d!70813))

(declare-fun m!322589 () Bool)

(assert (=> bs!17398 m!322589))

(assert (=> bs!17398 m!322429))

(assert (=> bs!17398 m!322379))

(declare-fun m!322591 () Bool)

(assert (=> bs!17398 m!322591))

(assert (=> bs!17398 m!322363))

(assert (=> b!209502 d!70813))

(declare-datatypes ((tuple2!17990 0))(
  ( (tuple2!17991 (_1!9650 (_ BitVec 64)) (_2!9650 BitStream!8314)) )
))
(declare-fun lt!328211 () tuple2!17990)

(declare-fun d!70815 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17990)

(assert (=> d!70815 (= lt!328211 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9640 lt!327994) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327981))))

(assert (=> d!70815 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9640 lt!327994) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327981) (tuple2!17973 (_2!9650 lt!328211) (_1!9650 lt!328211)))))

(declare-fun bs!17399 () Bool)

(assert (= bs!17399 d!70815))

(assert (=> bs!17399 m!322429))

(declare-fun m!322593 () Bool)

(assert (=> bs!17399 m!322593))

(assert (=> b!209502 d!70815))

(declare-fun d!70817 () Bool)

(declare-fun e!143095 () Bool)

(assert (=> d!70817 e!143095))

(declare-fun res!175996 () Bool)

(assert (=> d!70817 (=> (not res!175996) (not e!143095))))

(declare-fun lt!328217 () (_ BitVec 64))

(declare-fun lt!328216 () BitStream!8314)

(assert (=> d!70817 (= res!175996 (= (bvadd lt!328217 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4603 (buf!5117 lt!328216)) (currentByte!9653 lt!328216) (currentBit!9648 lt!328216))))))

(assert (=> d!70817 (or (not (= (bvand lt!328217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!328217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!328217 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70817 (= lt!328217 (bitIndex!0 (size!4603 (buf!5117 (_1!9640 lt!327994))) (currentByte!9653 (_1!9640 lt!327994)) (currentBit!9648 (_1!9640 lt!327994))))))

(declare-fun moveBitIndex!0 (BitStream!8314 (_ BitVec 64)) tuple2!17966)

(assert (=> d!70817 (= lt!328216 (_2!9638 (moveBitIndex!0 (_1!9640 lt!327994) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8314 (_ BitVec 64)) Bool)

(assert (=> d!70817 (moveBitIndexPrecond!0 (_1!9640 lt!327994) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!70817 (= (withMovedBitIndex!0 (_1!9640 lt!327994) #b0000000000000000000000000000000000000000000000000000000000000001) lt!328216)))

(declare-fun b!209636 () Bool)

(assert (=> b!209636 (= e!143095 (= (size!4603 (buf!5117 (_1!9640 lt!327994))) (size!4603 (buf!5117 lt!328216))))))

(assert (= (and d!70817 res!175996) b!209636))

(declare-fun m!322595 () Bool)

(assert (=> d!70817 m!322595))

(declare-fun m!322597 () Bool)

(assert (=> d!70817 m!322597))

(declare-fun m!322599 () Bool)

(assert (=> d!70817 m!322599))

(declare-fun m!322601 () Bool)

(assert (=> d!70817 m!322601))

(assert (=> b!209502 d!70817))

(declare-fun b!209647 () Bool)

(declare-fun e!143100 () Unit!14917)

(declare-fun lt!328260 () Unit!14917)

(assert (=> b!209647 (= e!143100 lt!328260)))

(declare-fun lt!328258 () (_ BitVec 64))

(assert (=> b!209647 (= lt!328258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!328273 () (_ BitVec 64))

(assert (=> b!209647 (= lt!328273 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10472 array!10472 (_ BitVec 64) (_ BitVec 64)) Unit!14917)

(assert (=> b!209647 (= lt!328260 (arrayBitRangesEqSymmetric!0 (buf!5117 (_2!9638 lt!327996)) (buf!5117 (_2!9638 lt!327987)) lt!328258 lt!328273))))

(assert (=> b!209647 (arrayBitRangesEq!0 (buf!5117 (_2!9638 lt!327987)) (buf!5117 (_2!9638 lt!327996)) lt!328258 lt!328273)))

(declare-fun lt!328271 () tuple2!17970)

(declare-fun lt!328263 () (_ BitVec 64))

(declare-fun b!209648 () Bool)

(declare-fun e!143101 () Bool)

(declare-fun lt!328262 () (_ BitVec 64))

(assert (=> b!209648 (= e!143101 (= (_1!9640 lt!328271) (withMovedBitIndex!0 (_2!9640 lt!328271) (bvsub lt!328262 lt!328263))))))

(assert (=> b!209648 (or (= (bvand lt!328262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328263 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328262 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328262 lt!328263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209648 (= lt!328263 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327987))) (currentByte!9653 (_2!9638 lt!327987)) (currentBit!9648 (_2!9638 lt!327987))))))

(assert (=> b!209648 (= lt!328262 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))))))

(declare-fun b!209649 () Bool)

(declare-fun Unit!14923 () Unit!14917)

(assert (=> b!209649 (= e!143100 Unit!14923)))

(declare-fun b!209650 () Bool)

(declare-fun res!176003 () Bool)

(assert (=> b!209650 (=> (not res!176003) (not e!143101))))

(assert (=> b!209650 (= res!176003 (isPrefixOf!0 (_2!9640 lt!328271) (_2!9638 lt!327987)))))

(declare-fun d!70819 () Bool)

(assert (=> d!70819 e!143101))

(declare-fun res!176004 () Bool)

(assert (=> d!70819 (=> (not res!176004) (not e!143101))))

(assert (=> d!70819 (= res!176004 (isPrefixOf!0 (_1!9640 lt!328271) (_2!9640 lt!328271)))))

(declare-fun lt!328267 () BitStream!8314)

(assert (=> d!70819 (= lt!328271 (tuple2!17971 lt!328267 (_2!9638 lt!327987)))))

(declare-fun lt!328268 () Unit!14917)

(declare-fun lt!328264 () Unit!14917)

(assert (=> d!70819 (= lt!328268 lt!328264)))

(assert (=> d!70819 (isPrefixOf!0 lt!328267 (_2!9638 lt!327987))))

(assert (=> d!70819 (= lt!328264 (lemmaIsPrefixTransitive!0 lt!328267 (_2!9638 lt!327987) (_2!9638 lt!327987)))))

(declare-fun lt!328269 () Unit!14917)

(declare-fun lt!328265 () Unit!14917)

(assert (=> d!70819 (= lt!328269 lt!328265)))

(assert (=> d!70819 (isPrefixOf!0 lt!328267 (_2!9638 lt!327987))))

(assert (=> d!70819 (= lt!328265 (lemmaIsPrefixTransitive!0 lt!328267 (_2!9638 lt!327996) (_2!9638 lt!327987)))))

(declare-fun lt!328272 () Unit!14917)

(assert (=> d!70819 (= lt!328272 e!143100)))

(declare-fun c!10301 () Bool)

(assert (=> d!70819 (= c!10301 (not (= (size!4603 (buf!5117 (_2!9638 lt!327996))) #b00000000000000000000000000000000)))))

(declare-fun lt!328270 () Unit!14917)

(declare-fun lt!328259 () Unit!14917)

(assert (=> d!70819 (= lt!328270 lt!328259)))

(assert (=> d!70819 (isPrefixOf!0 (_2!9638 lt!327987) (_2!9638 lt!327987))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8314) Unit!14917)

(assert (=> d!70819 (= lt!328259 (lemmaIsPrefixRefl!0 (_2!9638 lt!327987)))))

(declare-fun lt!328266 () Unit!14917)

(declare-fun lt!328275 () Unit!14917)

(assert (=> d!70819 (= lt!328266 lt!328275)))

(assert (=> d!70819 (= lt!328275 (lemmaIsPrefixRefl!0 (_2!9638 lt!327987)))))

(declare-fun lt!328276 () Unit!14917)

(declare-fun lt!328261 () Unit!14917)

(assert (=> d!70819 (= lt!328276 lt!328261)))

(assert (=> d!70819 (isPrefixOf!0 lt!328267 lt!328267)))

(assert (=> d!70819 (= lt!328261 (lemmaIsPrefixRefl!0 lt!328267))))

(declare-fun lt!328274 () Unit!14917)

(declare-fun lt!328277 () Unit!14917)

(assert (=> d!70819 (= lt!328274 lt!328277)))

(assert (=> d!70819 (isPrefixOf!0 (_2!9638 lt!327996) (_2!9638 lt!327996))))

(assert (=> d!70819 (= lt!328277 (lemmaIsPrefixRefl!0 (_2!9638 lt!327996)))))

(assert (=> d!70819 (= lt!328267 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))))))

(assert (=> d!70819 (isPrefixOf!0 (_2!9638 lt!327996) (_2!9638 lt!327987))))

(assert (=> d!70819 (= (reader!0 (_2!9638 lt!327996) (_2!9638 lt!327987)) lt!328271)))

(declare-fun b!209651 () Bool)

(declare-fun res!176005 () Bool)

(assert (=> b!209651 (=> (not res!176005) (not e!143101))))

(assert (=> b!209651 (= res!176005 (isPrefixOf!0 (_1!9640 lt!328271) (_2!9638 lt!327996)))))

(assert (= (and d!70819 c!10301) b!209647))

(assert (= (and d!70819 (not c!10301)) b!209649))

(assert (= (and d!70819 res!176004) b!209651))

(assert (= (and b!209651 res!176005) b!209650))

(assert (= (and b!209650 res!176003) b!209648))

(declare-fun m!322603 () Bool)

(assert (=> b!209648 m!322603))

(assert (=> b!209648 m!322407))

(assert (=> b!209648 m!322415))

(declare-fun m!322605 () Bool)

(assert (=> d!70819 m!322605))

(assert (=> d!70819 m!322393))

(declare-fun m!322607 () Bool)

(assert (=> d!70819 m!322607))

(declare-fun m!322609 () Bool)

(assert (=> d!70819 m!322609))

(declare-fun m!322611 () Bool)

(assert (=> d!70819 m!322611))

(declare-fun m!322613 () Bool)

(assert (=> d!70819 m!322613))

(declare-fun m!322615 () Bool)

(assert (=> d!70819 m!322615))

(declare-fun m!322617 () Bool)

(assert (=> d!70819 m!322617))

(declare-fun m!322619 () Bool)

(assert (=> d!70819 m!322619))

(declare-fun m!322621 () Bool)

(assert (=> d!70819 m!322621))

(declare-fun m!322623 () Bool)

(assert (=> d!70819 m!322623))

(assert (=> b!209647 m!322415))

(declare-fun m!322625 () Bool)

(assert (=> b!209647 m!322625))

(declare-fun m!322627 () Bool)

(assert (=> b!209647 m!322627))

(declare-fun m!322629 () Bool)

(assert (=> b!209650 m!322629))

(declare-fun m!322631 () Bool)

(assert (=> b!209651 m!322631))

(assert (=> b!209499 d!70819))

(declare-fun d!70821 () Bool)

(assert (=> d!70821 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!209499 d!70821))

(declare-fun d!70823 () Bool)

(assert (=> d!70823 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204)) lt!327976) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204))) lt!327976))))

(declare-fun bs!17400 () Bool)

(assert (= bs!17400 d!70823))

(declare-fun m!322633 () Bool)

(assert (=> bs!17400 m!322633))

(assert (=> b!209499 d!70823))

(declare-fun d!70825 () Bool)

(declare-fun lt!328278 () tuple2!17990)

(assert (=> d!70825 (= lt!328278 (readNBitsLSBFirstsLoop!0 (_1!9640 lt!327972) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327981))))

(assert (=> d!70825 (= (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!327972) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327981) (tuple2!17973 (_2!9650 lt!328278) (_1!9650 lt!328278)))))

(declare-fun bs!17401 () Bool)

(assert (= bs!17401 d!70825))

(declare-fun m!322635 () Bool)

(assert (=> bs!17401 m!322635))

(assert (=> b!209499 d!70825))

(declare-fun d!70827 () Bool)

(assert (=> d!70827 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996))) lt!327993)))

(declare-fun lt!328281 () Unit!14917)

(declare-fun choose!9 (BitStream!8314 array!10472 (_ BitVec 64) BitStream!8314) Unit!14917)

(assert (=> d!70827 (= lt!328281 (choose!9 (_2!9638 lt!327996) (buf!5117 (_2!9638 lt!327987)) lt!327993 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996)))))))

(assert (=> d!70827 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9638 lt!327996) (buf!5117 (_2!9638 lt!327987)) lt!327993) lt!328281)))

(declare-fun bs!17402 () Bool)

(assert (= bs!17402 d!70827))

(assert (=> bs!17402 m!322383))

(declare-fun m!322637 () Bool)

(assert (=> bs!17402 m!322637))

(assert (=> b!209499 d!70827))

(declare-fun d!70829 () Bool)

(assert (=> d!70829 (= (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327996)))) (and (bvsge (currentBit!9648 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9648 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9653 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327996)))) (and (= (currentBit!9648 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327996))))))))))

(assert (=> b!209499 d!70829))

(declare-fun d!70831 () Bool)

(declare-datatypes ((tuple2!17992 0))(
  ( (tuple2!17993 (_1!9651 Bool) (_2!9651 BitStream!8314)) )
))
(declare-fun lt!328284 () tuple2!17992)

(declare-fun readBit!0 (BitStream!8314) tuple2!17992)

(assert (=> d!70831 (= lt!328284 (readBit!0 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204))))))

(assert (=> d!70831 (= (readBitPure!0 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204))) (tuple2!17969 (_2!9651 lt!328284) (_1!9651 lt!328284)))))

(declare-fun bs!17403 () Bool)

(assert (= bs!17403 d!70831))

(declare-fun m!322639 () Bool)

(assert (=> bs!17403 m!322639))

(assert (=> b!209499 d!70831))

(declare-fun d!70833 () Bool)

(declare-fun lt!328285 () tuple2!17992)

(assert (=> d!70833 (= lt!328285 (readBit!0 (_1!9640 lt!327994)))))

(assert (=> d!70833 (= (readBitPure!0 (_1!9640 lt!327994)) (tuple2!17969 (_2!9651 lt!328285) (_1!9651 lt!328285)))))

(declare-fun bs!17404 () Bool)

(assert (= bs!17404 d!70833))

(declare-fun m!322641 () Bool)

(assert (=> bs!17404 m!322641))

(assert (=> b!209499 d!70833))

(declare-fun d!70835 () Bool)

(declare-fun e!143104 () Bool)

(assert (=> d!70835 e!143104))

(declare-fun res!176008 () Bool)

(assert (=> d!70835 (=> (not res!176008) (not e!143104))))

(declare-fun lt!328297 () tuple2!17968)

(declare-fun lt!328295 () tuple2!17968)

(assert (=> d!70835 (= res!176008 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!328297))) (currentByte!9653 (_1!9639 lt!328297)) (currentBit!9648 (_1!9639 lt!328297))) (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!328295))) (currentByte!9653 (_1!9639 lt!328295)) (currentBit!9648 (_1!9639 lt!328295)))))))

(declare-fun lt!328296 () BitStream!8314)

(declare-fun lt!328294 () Unit!14917)

(declare-fun choose!50 (BitStream!8314 BitStream!8314 BitStream!8314 tuple2!17968 tuple2!17968 BitStream!8314 Bool tuple2!17968 tuple2!17968 BitStream!8314 Bool) Unit!14917)

(assert (=> d!70835 (= lt!328294 (choose!50 lt!327978 (_2!9638 lt!327987) lt!328296 lt!328297 (tuple2!17969 (_1!9639 lt!328297) (_2!9639 lt!328297)) (_1!9639 lt!328297) (_2!9639 lt!328297) lt!328295 (tuple2!17969 (_1!9639 lt!328295) (_2!9639 lt!328295)) (_1!9639 lt!328295) (_2!9639 lt!328295)))))

(assert (=> d!70835 (= lt!328295 (readBitPure!0 lt!328296))))

(assert (=> d!70835 (= lt!328297 (readBitPure!0 lt!327978))))

(assert (=> d!70835 (= lt!328296 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 lt!327978) (currentBit!9648 lt!327978)))))

(assert (=> d!70835 (invariant!0 (currentBit!9648 lt!327978) (currentByte!9653 lt!327978) (size!4603 (buf!5117 (_2!9638 lt!327987))))))

(assert (=> d!70835 (= (readBitPrefixLemma!0 lt!327978 (_2!9638 lt!327987)) lt!328294)))

(declare-fun b!209654 () Bool)

(assert (=> b!209654 (= e!143104 (= (_2!9639 lt!328297) (_2!9639 lt!328295)))))

(assert (= (and d!70835 res!176008) b!209654))

(declare-fun m!322643 () Bool)

(assert (=> d!70835 m!322643))

(declare-fun m!322645 () Bool)

(assert (=> d!70835 m!322645))

(declare-fun m!322647 () Bool)

(assert (=> d!70835 m!322647))

(declare-fun m!322649 () Bool)

(assert (=> d!70835 m!322649))

(declare-fun m!322651 () Bool)

(assert (=> d!70835 m!322651))

(assert (=> d!70835 m!322361))

(assert (=> b!209499 d!70835))

(declare-fun b!209655 () Bool)

(declare-fun e!143105 () Unit!14917)

(declare-fun lt!328300 () Unit!14917)

(assert (=> b!209655 (= e!143105 lt!328300)))

(declare-fun lt!328298 () (_ BitVec 64))

(assert (=> b!209655 (= lt!328298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!328313 () (_ BitVec 64))

(assert (=> b!209655 (= lt!328313 (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(assert (=> b!209655 (= lt!328300 (arrayBitRangesEqSymmetric!0 (buf!5117 thiss!1204) (buf!5117 (_2!9638 lt!327987)) lt!328298 lt!328313))))

(assert (=> b!209655 (arrayBitRangesEq!0 (buf!5117 (_2!9638 lt!327987)) (buf!5117 thiss!1204) lt!328298 lt!328313)))

(declare-fun lt!328311 () tuple2!17970)

(declare-fun lt!328303 () (_ BitVec 64))

(declare-fun e!143106 () Bool)

(declare-fun lt!328302 () (_ BitVec 64))

(declare-fun b!209656 () Bool)

(assert (=> b!209656 (= e!143106 (= (_1!9640 lt!328311) (withMovedBitIndex!0 (_2!9640 lt!328311) (bvsub lt!328302 lt!328303))))))

(assert (=> b!209656 (or (= (bvand lt!328302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328302 lt!328303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209656 (= lt!328303 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327987))) (currentByte!9653 (_2!9638 lt!327987)) (currentBit!9648 (_2!9638 lt!327987))))))

(assert (=> b!209656 (= lt!328302 (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(declare-fun b!209657 () Bool)

(declare-fun Unit!14924 () Unit!14917)

(assert (=> b!209657 (= e!143105 Unit!14924)))

(declare-fun b!209658 () Bool)

(declare-fun res!176009 () Bool)

(assert (=> b!209658 (=> (not res!176009) (not e!143106))))

(assert (=> b!209658 (= res!176009 (isPrefixOf!0 (_2!9640 lt!328311) (_2!9638 lt!327987)))))

(declare-fun d!70837 () Bool)

(assert (=> d!70837 e!143106))

(declare-fun res!176010 () Bool)

(assert (=> d!70837 (=> (not res!176010) (not e!143106))))

(assert (=> d!70837 (= res!176010 (isPrefixOf!0 (_1!9640 lt!328311) (_2!9640 lt!328311)))))

(declare-fun lt!328307 () BitStream!8314)

(assert (=> d!70837 (= lt!328311 (tuple2!17971 lt!328307 (_2!9638 lt!327987)))))

(declare-fun lt!328308 () Unit!14917)

(declare-fun lt!328304 () Unit!14917)

(assert (=> d!70837 (= lt!328308 lt!328304)))

(assert (=> d!70837 (isPrefixOf!0 lt!328307 (_2!9638 lt!327987))))

(assert (=> d!70837 (= lt!328304 (lemmaIsPrefixTransitive!0 lt!328307 (_2!9638 lt!327987) (_2!9638 lt!327987)))))

(declare-fun lt!328309 () Unit!14917)

(declare-fun lt!328305 () Unit!14917)

(assert (=> d!70837 (= lt!328309 lt!328305)))

(assert (=> d!70837 (isPrefixOf!0 lt!328307 (_2!9638 lt!327987))))

(assert (=> d!70837 (= lt!328305 (lemmaIsPrefixTransitive!0 lt!328307 thiss!1204 (_2!9638 lt!327987)))))

(declare-fun lt!328312 () Unit!14917)

(assert (=> d!70837 (= lt!328312 e!143105)))

(declare-fun c!10302 () Bool)

(assert (=> d!70837 (= c!10302 (not (= (size!4603 (buf!5117 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!328310 () Unit!14917)

(declare-fun lt!328299 () Unit!14917)

(assert (=> d!70837 (= lt!328310 lt!328299)))

(assert (=> d!70837 (isPrefixOf!0 (_2!9638 lt!327987) (_2!9638 lt!327987))))

(assert (=> d!70837 (= lt!328299 (lemmaIsPrefixRefl!0 (_2!9638 lt!327987)))))

(declare-fun lt!328306 () Unit!14917)

(declare-fun lt!328315 () Unit!14917)

(assert (=> d!70837 (= lt!328306 lt!328315)))

(assert (=> d!70837 (= lt!328315 (lemmaIsPrefixRefl!0 (_2!9638 lt!327987)))))

(declare-fun lt!328316 () Unit!14917)

(declare-fun lt!328301 () Unit!14917)

(assert (=> d!70837 (= lt!328316 lt!328301)))

(assert (=> d!70837 (isPrefixOf!0 lt!328307 lt!328307)))

(assert (=> d!70837 (= lt!328301 (lemmaIsPrefixRefl!0 lt!328307))))

(declare-fun lt!328314 () Unit!14917)

(declare-fun lt!328317 () Unit!14917)

(assert (=> d!70837 (= lt!328314 lt!328317)))

(assert (=> d!70837 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70837 (= lt!328317 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70837 (= lt!328307 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(assert (=> d!70837 (isPrefixOf!0 thiss!1204 (_2!9638 lt!327987))))

(assert (=> d!70837 (= (reader!0 thiss!1204 (_2!9638 lt!327987)) lt!328311)))

(declare-fun b!209659 () Bool)

(declare-fun res!176011 () Bool)

(assert (=> b!209659 (=> (not res!176011) (not e!143106))))

(assert (=> b!209659 (= res!176011 (isPrefixOf!0 (_1!9640 lt!328311) thiss!1204))))

(assert (= (and d!70837 c!10302) b!209655))

(assert (= (and d!70837 (not c!10302)) b!209657))

(assert (= (and d!70837 res!176010) b!209659))

(assert (= (and b!209659 res!176011) b!209658))

(assert (= (and b!209658 res!176009) b!209656))

(declare-fun m!322653 () Bool)

(assert (=> b!209656 m!322653))

(assert (=> b!209656 m!322407))

(assert (=> b!209656 m!322417))

(declare-fun m!322655 () Bool)

(assert (=> d!70837 m!322655))

(assert (=> d!70837 m!322409))

(declare-fun m!322657 () Bool)

(assert (=> d!70837 m!322657))

(assert (=> d!70837 m!322609))

(assert (=> d!70837 m!322611))

(declare-fun m!322659 () Bool)

(assert (=> d!70837 m!322659))

(declare-fun m!322661 () Bool)

(assert (=> d!70837 m!322661))

(declare-fun m!322663 () Bool)

(assert (=> d!70837 m!322663))

(declare-fun m!322665 () Bool)

(assert (=> d!70837 m!322665))

(declare-fun m!322667 () Bool)

(assert (=> d!70837 m!322667))

(declare-fun m!322669 () Bool)

(assert (=> d!70837 m!322669))

(assert (=> b!209655 m!322417))

(declare-fun m!322671 () Bool)

(assert (=> b!209655 m!322671))

(declare-fun m!322673 () Bool)

(assert (=> b!209655 m!322673))

(declare-fun m!322675 () Bool)

(assert (=> b!209658 m!322675))

(declare-fun m!322677 () Bool)

(assert (=> b!209659 m!322677))

(assert (=> b!209499 d!70837))

(declare-fun d!70839 () Bool)

(declare-fun lt!328318 () tuple2!17990)

(assert (=> d!70839 (= lt!328318 (readNBitsLSBFirstsLoop!0 (_1!9640 lt!327994) nBits!348 i!590 lt!327998))))

(assert (=> d!70839 (= (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!327994) nBits!348 i!590 lt!327998) (tuple2!17973 (_2!9650 lt!328318) (_1!9650 lt!328318)))))

(declare-fun bs!17405 () Bool)

(assert (= bs!17405 d!70839))

(declare-fun m!322679 () Bool)

(assert (=> bs!17405 m!322679))

(assert (=> b!209499 d!70839))

(declare-fun d!70841 () Bool)

(declare-fun lt!328319 () tuple2!17992)

(assert (=> d!70841 (= lt!328319 (readBit!0 lt!327978))))

(assert (=> d!70841 (= (readBitPure!0 lt!327978) (tuple2!17969 (_2!9651 lt!328319) (_1!9651 lt!328319)))))

(declare-fun bs!17406 () Bool)

(assert (= bs!17406 d!70841))

(declare-fun m!322681 () Bool)

(assert (=> bs!17406 m!322681))

(assert (=> b!209499 d!70841))

(declare-fun d!70843 () Bool)

(assert (=> d!70843 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996))) lt!327993) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996)))) lt!327993))))

(declare-fun bs!17407 () Bool)

(assert (= bs!17407 d!70843))

(declare-fun m!322683 () Bool)

(assert (=> bs!17407 m!322683))

(assert (=> b!209499 d!70843))

(declare-fun d!70845 () Bool)

(declare-fun e!143107 () Bool)

(assert (=> d!70845 e!143107))

(declare-fun res!176013 () Bool)

(assert (=> d!70845 (=> (not res!176013) (not e!143107))))

(declare-fun lt!328325 () (_ BitVec 64))

(declare-fun lt!328323 () (_ BitVec 64))

(declare-fun lt!328320 () (_ BitVec 64))

(assert (=> d!70845 (= res!176013 (= lt!328320 (bvsub lt!328325 lt!328323)))))

(assert (=> d!70845 (or (= (bvand lt!328325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328323 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328325 lt!328323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70845 (= lt!328323 (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327997)))) ((_ sign_extend 32) (currentByte!9653 (_1!9639 lt!327997))) ((_ sign_extend 32) (currentBit!9648 (_1!9639 lt!327997)))))))

(declare-fun lt!328321 () (_ BitVec 64))

(declare-fun lt!328324 () (_ BitVec 64))

(assert (=> d!70845 (= lt!328325 (bvmul lt!328321 lt!328324))))

(assert (=> d!70845 (or (= lt!328321 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328324 (bvsdiv (bvmul lt!328321 lt!328324) lt!328321)))))

(assert (=> d!70845 (= lt!328324 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70845 (= lt!328321 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327997)))))))

(assert (=> d!70845 (= lt!328320 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9653 (_1!9639 lt!327997))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9648 (_1!9639 lt!327997)))))))

(assert (=> d!70845 (invariant!0 (currentBit!9648 (_1!9639 lt!327997)) (currentByte!9653 (_1!9639 lt!327997)) (size!4603 (buf!5117 (_1!9639 lt!327997))))))

(assert (=> d!70845 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!327997))) (currentByte!9653 (_1!9639 lt!327997)) (currentBit!9648 (_1!9639 lt!327997))) lt!328320)))

(declare-fun b!209660 () Bool)

(declare-fun res!176012 () Bool)

(assert (=> b!209660 (=> (not res!176012) (not e!143107))))

(assert (=> b!209660 (= res!176012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328320))))

(declare-fun b!209661 () Bool)

(declare-fun lt!328322 () (_ BitVec 64))

(assert (=> b!209661 (= e!143107 (bvsle lt!328320 (bvmul lt!328322 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209661 (or (= lt!328322 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328322 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328322)))))

(assert (=> b!209661 (= lt!328322 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327997)))))))

(assert (= (and d!70845 res!176013) b!209660))

(assert (= (and b!209660 res!176012) b!209661))

(declare-fun m!322685 () Bool)

(assert (=> d!70845 m!322685))

(declare-fun m!322687 () Bool)

(assert (=> d!70845 m!322687))

(assert (=> b!209499 d!70845))

(declare-fun d!70847 () Bool)

(declare-fun e!143108 () Bool)

(assert (=> d!70847 e!143108))

(declare-fun res!176015 () Bool)

(assert (=> d!70847 (=> (not res!176015) (not e!143108))))

(declare-fun lt!328329 () (_ BitVec 64))

(declare-fun lt!328331 () (_ BitVec 64))

(declare-fun lt!328326 () (_ BitVec 64))

(assert (=> d!70847 (= res!176015 (= lt!328326 (bvsub lt!328331 lt!328329)))))

(assert (=> d!70847 (or (= (bvand lt!328331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328331 lt!328329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70847 (= lt!328329 (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327985)))) ((_ sign_extend 32) (currentByte!9653 (_1!9639 lt!327985))) ((_ sign_extend 32) (currentBit!9648 (_1!9639 lt!327985)))))))

(declare-fun lt!328327 () (_ BitVec 64))

(declare-fun lt!328330 () (_ BitVec 64))

(assert (=> d!70847 (= lt!328331 (bvmul lt!328327 lt!328330))))

(assert (=> d!70847 (or (= lt!328327 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328330 (bvsdiv (bvmul lt!328327 lt!328330) lt!328327)))))

(assert (=> d!70847 (= lt!328330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70847 (= lt!328327 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327985)))))))

(assert (=> d!70847 (= lt!328326 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9653 (_1!9639 lt!327985))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9648 (_1!9639 lt!327985)))))))

(assert (=> d!70847 (invariant!0 (currentBit!9648 (_1!9639 lt!327985)) (currentByte!9653 (_1!9639 lt!327985)) (size!4603 (buf!5117 (_1!9639 lt!327985))))))

(assert (=> d!70847 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!327985))) (currentByte!9653 (_1!9639 lt!327985)) (currentBit!9648 (_1!9639 lt!327985))) lt!328326)))

(declare-fun b!209662 () Bool)

(declare-fun res!176014 () Bool)

(assert (=> b!209662 (=> (not res!176014) (not e!143108))))

(assert (=> b!209662 (= res!176014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328326))))

(declare-fun b!209663 () Bool)

(declare-fun lt!328328 () (_ BitVec 64))

(assert (=> b!209663 (= e!143108 (bvsle lt!328326 (bvmul lt!328328 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209663 (or (= lt!328328 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328328 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328328)))))

(assert (=> b!209663 (= lt!328328 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327985)))))))

(assert (= (and d!70847 res!176015) b!209662))

(assert (= (and b!209662 res!176014) b!209663))

(declare-fun m!322689 () Bool)

(assert (=> d!70847 m!322689))

(declare-fun m!322691 () Bool)

(assert (=> d!70847 m!322691))

(assert (=> b!209499 d!70847))

(declare-fun d!70849 () Bool)

(assert (=> d!70849 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204)) lt!327976)))

(declare-fun lt!328332 () Unit!14917)

(assert (=> d!70849 (= lt!328332 (choose!9 thiss!1204 (buf!5117 (_2!9638 lt!327987)) lt!327976 (BitStream!8315 (buf!5117 (_2!9638 lt!327987)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204))))))

(assert (=> d!70849 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5117 (_2!9638 lt!327987)) lt!327976) lt!328332)))

(declare-fun bs!17408 () Bool)

(assert (= bs!17408 d!70849))

(assert (=> bs!17408 m!322381))

(declare-fun m!322693 () Bool)

(assert (=> bs!17408 m!322693))

(assert (=> b!209499 d!70849))

(declare-fun d!70851 () Bool)

(declare-fun e!143109 () Bool)

(assert (=> d!70851 e!143109))

(declare-fun res!176017 () Bool)

(assert (=> d!70851 (=> (not res!176017) (not e!143109))))

(declare-fun lt!328338 () (_ BitVec 64))

(declare-fun lt!328333 () (_ BitVec 64))

(declare-fun lt!328336 () (_ BitVec 64))

(assert (=> d!70851 (= res!176017 (= lt!328333 (bvsub lt!328338 lt!328336)))))

(assert (=> d!70851 (or (= (bvand lt!328338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328338 lt!328336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70851 (= lt!328336 (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327973)))) ((_ sign_extend 32) (currentByte!9653 (_1!9639 lt!327973))) ((_ sign_extend 32) (currentBit!9648 (_1!9639 lt!327973)))))))

(declare-fun lt!328334 () (_ BitVec 64))

(declare-fun lt!328337 () (_ BitVec 64))

(assert (=> d!70851 (= lt!328338 (bvmul lt!328334 lt!328337))))

(assert (=> d!70851 (or (= lt!328334 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328337 (bvsdiv (bvmul lt!328334 lt!328337) lt!328334)))))

(assert (=> d!70851 (= lt!328337 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70851 (= lt!328334 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327973)))))))

(assert (=> d!70851 (= lt!328333 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9653 (_1!9639 lt!327973))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9648 (_1!9639 lt!327973)))))))

(assert (=> d!70851 (invariant!0 (currentBit!9648 (_1!9639 lt!327973)) (currentByte!9653 (_1!9639 lt!327973)) (size!4603 (buf!5117 (_1!9639 lt!327973))))))

(assert (=> d!70851 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!327973))) (currentByte!9653 (_1!9639 lt!327973)) (currentBit!9648 (_1!9639 lt!327973))) lt!328333)))

(declare-fun b!209664 () Bool)

(declare-fun res!176016 () Bool)

(assert (=> b!209664 (=> (not res!176016) (not e!143109))))

(assert (=> b!209664 (= res!176016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328333))))

(declare-fun b!209665 () Bool)

(declare-fun lt!328335 () (_ BitVec 64))

(assert (=> b!209665 (= e!143109 (bvsle lt!328333 (bvmul lt!328335 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209665 (or (= lt!328335 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328335 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328335)))))

(assert (=> b!209665 (= lt!328335 ((_ sign_extend 32) (size!4603 (buf!5117 (_1!9639 lt!327973)))))))

(assert (= (and d!70851 res!176017) b!209664))

(assert (= (and b!209664 res!176016) b!209665))

(declare-fun m!322695 () Bool)

(assert (=> d!70851 m!322695))

(declare-fun m!322697 () Bool)

(assert (=> d!70851 m!322697))

(assert (=> b!209496 d!70851))

(assert (=> b!209507 d!70811))

(declare-fun d!70853 () Bool)

(assert (=> d!70853 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 thiss!1204))))))

(declare-fun bs!17409 () Bool)

(assert (= bs!17409 d!70853))

(assert (=> bs!17409 m!322425))

(assert (=> start!43974 d!70853))

(declare-fun d!70855 () Bool)

(assert (=> d!70855 (= (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327987)))) (and (bvsge (currentBit!9648 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9648 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9653 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327987)))) (and (= (currentBit!9648 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327987))))))))))

(assert (=> b!209506 d!70855))

(declare-fun d!70857 () Bool)

(declare-fun res!176019 () Bool)

(declare-fun e!143110 () Bool)

(assert (=> d!70857 (=> (not res!176019) (not e!143110))))

(assert (=> d!70857 (= res!176019 (= (size!4603 (buf!5117 (_2!9638 lt!327996))) (size!4603 (buf!5117 (_2!9638 lt!327987)))))))

(assert (=> d!70857 (= (isPrefixOf!0 (_2!9638 lt!327996) (_2!9638 lt!327987)) e!143110)))

(declare-fun b!209666 () Bool)

(declare-fun res!176018 () Bool)

(assert (=> b!209666 (=> (not res!176018) (not e!143110))))

(assert (=> b!209666 (= res!176018 (bvsle (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))) (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327987))) (currentByte!9653 (_2!9638 lt!327987)) (currentBit!9648 (_2!9638 lt!327987)))))))

(declare-fun b!209667 () Bool)

(declare-fun e!143111 () Bool)

(assert (=> b!209667 (= e!143110 e!143111)))

(declare-fun res!176020 () Bool)

(assert (=> b!209667 (=> res!176020 e!143111)))

(assert (=> b!209667 (= res!176020 (= (size!4603 (buf!5117 (_2!9638 lt!327996))) #b00000000000000000000000000000000))))

(declare-fun b!209668 () Bool)

(assert (=> b!209668 (= e!143111 (arrayBitRangesEq!0 (buf!5117 (_2!9638 lt!327996)) (buf!5117 (_2!9638 lt!327987)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996)))))))

(assert (= (and d!70857 res!176019) b!209666))

(assert (= (and b!209666 res!176018) b!209667))

(assert (= (and b!209667 (not res!176020)) b!209668))

(assert (=> b!209666 m!322415))

(assert (=> b!209666 m!322407))

(assert (=> b!209668 m!322415))

(assert (=> b!209668 m!322415))

(declare-fun m!322699 () Bool)

(assert (=> b!209668 m!322699))

(assert (=> b!209508 d!70857))

(assert (=> b!209497 d!70803))

(assert (=> b!209497 d!70805))

(declare-fun d!70859 () Bool)

(declare-fun e!143116 () Bool)

(assert (=> d!70859 e!143116))

(declare-fun res!176032 () Bool)

(assert (=> d!70859 (=> (not res!176032) (not e!143116))))

(declare-fun lt!328349 () tuple2!17966)

(assert (=> d!70859 (= res!176032 (= (size!4603 (buf!5117 thiss!1204)) (size!4603 (buf!5117 (_2!9638 lt!328349)))))))

(declare-fun choose!16 (BitStream!8314 Bool) tuple2!17966)

(assert (=> d!70859 (= lt!328349 (choose!16 thiss!1204 lt!327986))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70859 (validate_offset_bit!0 ((_ sign_extend 32) (size!4603 (buf!5117 thiss!1204))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204)))))

(assert (=> d!70859 (= (appendBit!0 thiss!1204 lt!327986) lt!328349)))

(declare-fun b!209681 () Bool)

(declare-fun e!143117 () Bool)

(declare-fun lt!328347 () tuple2!17968)

(assert (=> b!209681 (= e!143117 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!328347))) (currentByte!9653 (_1!9639 lt!328347)) (currentBit!9648 (_1!9639 lt!328347))) (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328349))) (currentByte!9653 (_2!9638 lt!328349)) (currentBit!9648 (_2!9638 lt!328349)))))))

(declare-fun b!209680 () Bool)

(assert (=> b!209680 (= e!143116 e!143117)))

(declare-fun res!176031 () Bool)

(assert (=> b!209680 (=> (not res!176031) (not e!143117))))

(assert (=> b!209680 (= res!176031 (and (= (_2!9639 lt!328347) lt!327986) (= (_1!9639 lt!328347) (_2!9638 lt!328349))))))

(assert (=> b!209680 (= lt!328347 (readBitPure!0 (readerFrom!0 (_2!9638 lt!328349) (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204))))))

(declare-fun b!209678 () Bool)

(declare-fun res!176030 () Bool)

(assert (=> b!209678 (=> (not res!176030) (not e!143116))))

(declare-fun lt!328348 () (_ BitVec 64))

(declare-fun lt!328350 () (_ BitVec 64))

(assert (=> b!209678 (= res!176030 (= (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328349))) (currentByte!9653 (_2!9638 lt!328349)) (currentBit!9648 (_2!9638 lt!328349))) (bvadd lt!328348 lt!328350)))))

(assert (=> b!209678 (or (not (= (bvand lt!328348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328350 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!328348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!328348 lt!328350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209678 (= lt!328350 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!209678 (= lt!328348 (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(declare-fun b!209679 () Bool)

(declare-fun res!176029 () Bool)

(assert (=> b!209679 (=> (not res!176029) (not e!143116))))

(assert (=> b!209679 (= res!176029 (isPrefixOf!0 thiss!1204 (_2!9638 lt!328349)))))

(assert (= (and d!70859 res!176032) b!209678))

(assert (= (and b!209678 res!176030) b!209679))

(assert (= (and b!209679 res!176029) b!209680))

(assert (= (and b!209680 res!176031) b!209681))

(declare-fun m!322701 () Bool)

(assert (=> b!209681 m!322701))

(declare-fun m!322703 () Bool)

(assert (=> b!209681 m!322703))

(declare-fun m!322705 () Bool)

(assert (=> d!70859 m!322705))

(declare-fun m!322707 () Bool)

(assert (=> d!70859 m!322707))

(declare-fun m!322709 () Bool)

(assert (=> b!209679 m!322709))

(assert (=> b!209678 m!322703))

(assert (=> b!209678 m!322417))

(declare-fun m!322711 () Bool)

(assert (=> b!209680 m!322711))

(assert (=> b!209680 m!322711))

(declare-fun m!322713 () Bool)

(assert (=> b!209680 m!322713))

(assert (=> b!209497 d!70859))

(declare-fun d!70861 () Bool)

(assert (=> d!70861 (= (invariant!0 (currentBit!9648 (_2!9638 lt!327987)) (currentByte!9653 (_2!9638 lt!327987)) (size!4603 (buf!5117 (_2!9638 lt!327987)))) (and (bvsge (currentBit!9648 (_2!9638 lt!327987)) #b00000000000000000000000000000000) (bvslt (currentBit!9648 (_2!9638 lt!327987)) #b00000000000000000000000000001000) (bvsge (currentByte!9653 (_2!9638 lt!327987)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9653 (_2!9638 lt!327987)) (size!4603 (buf!5117 (_2!9638 lt!327987)))) (and (= (currentBit!9648 (_2!9638 lt!327987)) #b00000000000000000000000000000000) (= (currentByte!9653 (_2!9638 lt!327987)) (size!4603 (buf!5117 (_2!9638 lt!327987))))))))))

(assert (=> b!209504 d!70861))

(declare-fun d!70863 () Bool)

(declare-fun lt!328351 () tuple2!17992)

(assert (=> d!70863 (= lt!328351 (readBit!0 (readerFrom!0 (_2!9638 lt!327996) (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204))))))

(assert (=> d!70863 (= (readBitPure!0 (readerFrom!0 (_2!9638 lt!327996) (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204))) (tuple2!17969 (_2!9651 lt!328351) (_1!9651 lt!328351)))))

(declare-fun bs!17410 () Bool)

(assert (= bs!17410 d!70863))

(assert (=> bs!17410 m!322395))

(declare-fun m!322715 () Bool)

(assert (=> bs!17410 m!322715))

(assert (=> b!209493 d!70863))

(declare-fun d!70865 () Bool)

(declare-fun e!143120 () Bool)

(assert (=> d!70865 e!143120))

(declare-fun res!176036 () Bool)

(assert (=> d!70865 (=> (not res!176036) (not e!143120))))

(assert (=> d!70865 (= res!176036 (invariant!0 (currentBit!9648 (_2!9638 lt!327996)) (currentByte!9653 (_2!9638 lt!327996)) (size!4603 (buf!5117 (_2!9638 lt!327996)))))))

(assert (=> d!70865 (= (readerFrom!0 (_2!9638 lt!327996) (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204)) (BitStream!8315 (buf!5117 (_2!9638 lt!327996)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)))))

(declare-fun b!209684 () Bool)

(assert (=> b!209684 (= e!143120 (invariant!0 (currentBit!9648 thiss!1204) (currentByte!9653 thiss!1204) (size!4603 (buf!5117 (_2!9638 lt!327996)))))))

(assert (= (and d!70865 res!176036) b!209684))

(assert (=> d!70865 m!322583))

(assert (=> b!209684 m!322367))

(assert (=> b!209493 d!70865))

(declare-fun d!70867 () Bool)

(assert (=> d!70867 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 thiss!1204))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204)) lt!327976) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 thiss!1204))) ((_ sign_extend 32) (currentByte!9653 thiss!1204)) ((_ sign_extend 32) (currentBit!9648 thiss!1204))) lt!327976))))

(declare-fun bs!17411 () Bool)

(assert (= bs!17411 d!70867))

(assert (=> bs!17411 m!322585))

(assert (=> b!209494 d!70867))

(declare-fun d!70869 () Bool)

(declare-fun e!143121 () Bool)

(assert (=> d!70869 e!143121))

(declare-fun res!176038 () Bool)

(assert (=> d!70869 (=> (not res!176038) (not e!143121))))

(declare-fun lt!328352 () (_ BitVec 64))

(declare-fun lt!328355 () (_ BitVec 64))

(declare-fun lt!328357 () (_ BitVec 64))

(assert (=> d!70869 (= res!176038 (= lt!328352 (bvsub lt!328357 lt!328355)))))

(assert (=> d!70869 (or (= (bvand lt!328357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328357 lt!328355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70869 (= lt!328355 (remainingBits!0 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327987))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327987)))))))

(declare-fun lt!328353 () (_ BitVec 64))

(declare-fun lt!328356 () (_ BitVec 64))

(assert (=> d!70869 (= lt!328357 (bvmul lt!328353 lt!328356))))

(assert (=> d!70869 (or (= lt!328353 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!328356 (bvsdiv (bvmul lt!328353 lt!328356) lt!328353)))))

(assert (=> d!70869 (= lt!328356 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70869 (= lt!328353 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))))))

(assert (=> d!70869 (= lt!328352 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327987))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327987)))))))

(assert (=> d!70869 (invariant!0 (currentBit!9648 (_2!9638 lt!327987)) (currentByte!9653 (_2!9638 lt!327987)) (size!4603 (buf!5117 (_2!9638 lt!327987))))))

(assert (=> d!70869 (= (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327987))) (currentByte!9653 (_2!9638 lt!327987)) (currentBit!9648 (_2!9638 lt!327987))) lt!328352)))

(declare-fun b!209685 () Bool)

(declare-fun res!176037 () Bool)

(assert (=> b!209685 (=> (not res!176037) (not e!143121))))

(assert (=> b!209685 (= res!176037 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!328352))))

(declare-fun b!209686 () Bool)

(declare-fun lt!328354 () (_ BitVec 64))

(assert (=> b!209686 (= e!143121 (bvsle lt!328352 (bvmul lt!328354 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209686 (or (= lt!328354 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!328354 #b0000000000000000000000000000000000000000000000000000000000001000) lt!328354)))))

(assert (=> b!209686 (= lt!328354 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327987)))))))

(assert (= (and d!70869 res!176038) b!209685))

(assert (= (and b!209685 res!176037) b!209686))

(declare-fun m!322717 () Bool)

(assert (=> d!70869 m!322717))

(assert (=> d!70869 m!322423))

(assert (=> b!209505 d!70869))

(declare-fun d!70871 () Bool)

(declare-fun res!176040 () Bool)

(declare-fun e!143122 () Bool)

(assert (=> d!70871 (=> (not res!176040) (not e!143122))))

(assert (=> d!70871 (= res!176040 (= (size!4603 (buf!5117 thiss!1204)) (size!4603 (buf!5117 (_2!9638 lt!327987)))))))

(assert (=> d!70871 (= (isPrefixOf!0 thiss!1204 (_2!9638 lt!327987)) e!143122)))

(declare-fun b!209687 () Bool)

(declare-fun res!176039 () Bool)

(assert (=> b!209687 (=> (not res!176039) (not e!143122))))

(assert (=> b!209687 (= res!176039 (bvsle (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204)) (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327987))) (currentByte!9653 (_2!9638 lt!327987)) (currentBit!9648 (_2!9638 lt!327987)))))))

(declare-fun b!209688 () Bool)

(declare-fun e!143123 () Bool)

(assert (=> b!209688 (= e!143122 e!143123)))

(declare-fun res!176041 () Bool)

(assert (=> b!209688 (=> res!176041 e!143123)))

(assert (=> b!209688 (= res!176041 (= (size!4603 (buf!5117 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209689 () Bool)

(assert (=> b!209689 (= e!143123 (arrayBitRangesEq!0 (buf!5117 thiss!1204) (buf!5117 (_2!9638 lt!327987)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4603 (buf!5117 thiss!1204)) (currentByte!9653 thiss!1204) (currentBit!9648 thiss!1204))))))

(assert (= (and d!70871 res!176040) b!209687))

(assert (= (and b!209687 res!176039) b!209688))

(assert (= (and b!209688 (not res!176041)) b!209689))

(assert (=> b!209687 m!322417))

(assert (=> b!209687 m!322407))

(assert (=> b!209689 m!322417))

(assert (=> b!209689 m!322417))

(declare-fun m!322719 () Bool)

(assert (=> b!209689 m!322719))

(assert (=> b!209505 d!70871))

(declare-fun d!70873 () Bool)

(assert (=> d!70873 (isPrefixOf!0 thiss!1204 (_2!9638 lt!327987))))

(declare-fun lt!328360 () Unit!14917)

(declare-fun choose!30 (BitStream!8314 BitStream!8314 BitStream!8314) Unit!14917)

(assert (=> d!70873 (= lt!328360 (choose!30 thiss!1204 (_2!9638 lt!327996) (_2!9638 lt!327987)))))

(assert (=> d!70873 (isPrefixOf!0 thiss!1204 (_2!9638 lt!327996))))

(assert (=> d!70873 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9638 lt!327996) (_2!9638 lt!327987)) lt!328360)))

(declare-fun bs!17412 () Bool)

(assert (= bs!17412 d!70873))

(assert (=> bs!17412 m!322409))

(declare-fun m!322721 () Bool)

(assert (=> bs!17412 m!322721))

(assert (=> bs!17412 m!322405))

(assert (=> b!209505 d!70873))

(declare-fun b!209825 () Bool)

(declare-fun res!176160 () Bool)

(declare-fun e!143202 () Bool)

(assert (=> b!209825 (=> (not res!176160) (not e!143202))))

(declare-fun lt!328706 () tuple2!17966)

(assert (=> b!209825 (= res!176160 (isPrefixOf!0 (_2!9638 lt!327996) (_2!9638 lt!328706)))))

(declare-fun b!209826 () Bool)

(declare-fun e!143207 () Bool)

(assert (=> b!209826 (= e!143202 e!143207)))

(declare-fun res!176165 () Bool)

(assert (=> b!209826 (=> (not res!176165) (not e!143207))))

(declare-fun lt!328753 () tuple2!17972)

(assert (=> b!209826 (= res!176165 (= (_2!9641 lt!328753) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!328719 () tuple2!17970)

(assert (=> b!209826 (= lt!328753 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!328719) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!328713 () Unit!14917)

(declare-fun lt!328746 () Unit!14917)

(assert (=> b!209826 (= lt!328713 lt!328746)))

(declare-fun lt!328711 () (_ BitVec 64))

(assert (=> b!209826 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!328706)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996))) lt!328711)))

(assert (=> b!209826 (= lt!328746 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9638 lt!327996) (buf!5117 (_2!9638 lt!328706)) lt!328711))))

(declare-fun e!143206 () Bool)

(assert (=> b!209826 e!143206))

(declare-fun res!176163 () Bool)

(assert (=> b!209826 (=> (not res!176163) (not e!143206))))

(assert (=> b!209826 (= res!176163 (and (= (size!4603 (buf!5117 (_2!9638 lt!327996))) (size!4603 (buf!5117 (_2!9638 lt!328706)))) (bvsge lt!328711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209826 (= lt!328711 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!209826 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!209826 (= lt!328719 (reader!0 (_2!9638 lt!327996) (_2!9638 lt!328706)))))

(declare-fun b!209827 () Bool)

(declare-fun e!143199 () tuple2!17966)

(declare-fun Unit!14925 () Unit!14917)

(assert (=> b!209827 (= e!143199 (tuple2!17967 Unit!14925 (_2!9638 lt!327996)))))

(declare-fun lt!328729 () Unit!14917)

(assert (=> b!209827 (= lt!328729 (lemmaIsPrefixRefl!0 (_2!9638 lt!327996)))))

(declare-fun call!3300 () Bool)

(assert (=> b!209827 call!3300))

(declare-fun lt!328712 () Unit!14917)

(assert (=> b!209827 (= lt!328712 lt!328729)))

(declare-fun b!209828 () Bool)

(declare-fun lt!328732 () tuple2!17966)

(assert (=> b!209828 (= e!143199 (tuple2!17967 (_1!9638 lt!328732) (_2!9638 lt!328732)))))

(declare-fun lt!328720 () Bool)

(assert (=> b!209828 (= lt!328720 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!328760 () tuple2!17966)

(assert (=> b!209828 (= lt!328760 (appendBit!0 (_2!9638 lt!327996) lt!328720))))

(declare-fun res!176161 () Bool)

(assert (=> b!209828 (= res!176161 (= (size!4603 (buf!5117 (_2!9638 lt!327996))) (size!4603 (buf!5117 (_2!9638 lt!328760)))))))

(declare-fun e!143205 () Bool)

(assert (=> b!209828 (=> (not res!176161) (not e!143205))))

(assert (=> b!209828 e!143205))

(declare-fun lt!328747 () tuple2!17966)

(assert (=> b!209828 (= lt!328747 lt!328760)))

(assert (=> b!209828 (= lt!328732 (appendBitsLSBFirstLoopTR!0 (_2!9638 lt!328747) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!328722 () Unit!14917)

(assert (=> b!209828 (= lt!328722 (lemmaIsPrefixTransitive!0 (_2!9638 lt!327996) (_2!9638 lt!328747) (_2!9638 lt!328732)))))

(assert (=> b!209828 (isPrefixOf!0 (_2!9638 lt!327996) (_2!9638 lt!328732))))

(declare-fun lt!328737 () Unit!14917)

(assert (=> b!209828 (= lt!328737 lt!328722)))

(assert (=> b!209828 (invariant!0 (currentBit!9648 (_2!9638 lt!327996)) (currentByte!9653 (_2!9638 lt!327996)) (size!4603 (buf!5117 (_2!9638 lt!328747))))))

(declare-fun lt!328717 () BitStream!8314)

(assert (=> b!209828 (= lt!328717 (BitStream!8315 (buf!5117 (_2!9638 lt!328747)) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))))))

(assert (=> b!209828 (invariant!0 (currentBit!9648 lt!328717) (currentByte!9653 lt!328717) (size!4603 (buf!5117 (_2!9638 lt!328732))))))

(declare-fun lt!328751 () BitStream!8314)

(assert (=> b!209828 (= lt!328751 (BitStream!8315 (buf!5117 (_2!9638 lt!328732)) (currentByte!9653 lt!328717) (currentBit!9648 lt!328717)))))

(declare-fun lt!328736 () tuple2!17968)

(assert (=> b!209828 (= lt!328736 (readBitPure!0 lt!328717))))

(declare-fun lt!328714 () tuple2!17968)

(assert (=> b!209828 (= lt!328714 (readBitPure!0 lt!328751))))

(declare-fun lt!328735 () Unit!14917)

(assert (=> b!209828 (= lt!328735 (readBitPrefixLemma!0 lt!328717 (_2!9638 lt!328732)))))

(declare-fun res!176162 () Bool)

(assert (=> b!209828 (= res!176162 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!328736))) (currentByte!9653 (_1!9639 lt!328736)) (currentBit!9648 (_1!9639 lt!328736))) (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!328714))) (currentByte!9653 (_1!9639 lt!328714)) (currentBit!9648 (_1!9639 lt!328714)))))))

(declare-fun e!143200 () Bool)

(assert (=> b!209828 (=> (not res!176162) (not e!143200))))

(assert (=> b!209828 e!143200))

(declare-fun lt!328730 () Unit!14917)

(assert (=> b!209828 (= lt!328730 lt!328735)))

(declare-fun lt!328727 () tuple2!17970)

(assert (=> b!209828 (= lt!328727 (reader!0 (_2!9638 lt!327996) (_2!9638 lt!328732)))))

(declare-fun lt!328738 () tuple2!17970)

(assert (=> b!209828 (= lt!328738 (reader!0 (_2!9638 lt!328747) (_2!9638 lt!328732)))))

(declare-fun lt!328750 () tuple2!17968)

(assert (=> b!209828 (= lt!328750 (readBitPure!0 (_1!9640 lt!328727)))))

(assert (=> b!209828 (= (_2!9639 lt!328750) lt!328720)))

(declare-fun lt!328709 () Unit!14917)

(declare-fun Unit!14926 () Unit!14917)

(assert (=> b!209828 (= lt!328709 Unit!14926)))

(declare-fun lt!328715 () (_ BitVec 64))

(assert (=> b!209828 (= lt!328715 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328733 () (_ BitVec 64))

(assert (=> b!209828 (= lt!328733 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328725 () Unit!14917)

(assert (=> b!209828 (= lt!328725 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9638 lt!327996) (buf!5117 (_2!9638 lt!328732)) lt!328733))))

(assert (=> b!209828 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!328732)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996))) lt!328733)))

(declare-fun lt!328740 () Unit!14917)

(assert (=> b!209828 (= lt!328740 lt!328725)))

(declare-fun lt!328761 () tuple2!17972)

(assert (=> b!209828 (= lt!328761 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!328727) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328715))))

(declare-fun lt!328748 () (_ BitVec 64))

(assert (=> b!209828 (= lt!328748 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!328756 () Unit!14917)

(assert (=> b!209828 (= lt!328756 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9638 lt!328747) (buf!5117 (_2!9638 lt!328732)) lt!328748))))

(assert (=> b!209828 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!328732)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!328747))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!328747))) lt!328748)))

(declare-fun lt!328749 () Unit!14917)

(assert (=> b!209828 (= lt!328749 lt!328756)))

(declare-fun lt!328752 () tuple2!17972)

(assert (=> b!209828 (= lt!328752 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!328738) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!328715 (ite (_2!9639 lt!328750) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!328755 () tuple2!17972)

(assert (=> b!209828 (= lt!328755 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!328727) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328715))))

(declare-fun c!10311 () Bool)

(assert (=> b!209828 (= c!10311 (_2!9639 (readBitPure!0 (_1!9640 lt!328727))))))

(declare-fun lt!328739 () tuple2!17972)

(declare-fun e!143203 () (_ BitVec 64))

(assert (=> b!209828 (= lt!328739 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9640 lt!328727) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!328715 e!143203)))))

(declare-fun lt!328754 () Unit!14917)

(assert (=> b!209828 (= lt!328754 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9640 lt!328727) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!328715))))

(assert (=> b!209828 (and (= (_2!9641 lt!328755) (_2!9641 lt!328739)) (= (_1!9641 lt!328755) (_1!9641 lt!328739)))))

(declare-fun lt!328723 () Unit!14917)

(assert (=> b!209828 (= lt!328723 lt!328754)))

(assert (=> b!209828 (= (_1!9640 lt!328727) (withMovedBitIndex!0 (_2!9640 lt!328727) (bvsub (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))) (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328732))) (currentByte!9653 (_2!9638 lt!328732)) (currentBit!9648 (_2!9638 lt!328732))))))))

(declare-fun lt!328731 () Unit!14917)

(declare-fun Unit!14927 () Unit!14917)

(assert (=> b!209828 (= lt!328731 Unit!14927)))

(assert (=> b!209828 (= (_1!9640 lt!328738) (withMovedBitIndex!0 (_2!9640 lt!328738) (bvsub (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328747))) (currentByte!9653 (_2!9638 lt!328747)) (currentBit!9648 (_2!9638 lt!328747))) (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328732))) (currentByte!9653 (_2!9638 lt!328732)) (currentBit!9648 (_2!9638 lt!328732))))))))

(declare-fun lt!328757 () Unit!14917)

(declare-fun Unit!14928 () Unit!14917)

(assert (=> b!209828 (= lt!328757 Unit!14928)))

(assert (=> b!209828 (= (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))) (bvsub (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328747))) (currentByte!9653 (_2!9638 lt!328747)) (currentBit!9648 (_2!9638 lt!328747))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!328745 () Unit!14917)

(declare-fun Unit!14929 () Unit!14917)

(assert (=> b!209828 (= lt!328745 Unit!14929)))

(assert (=> b!209828 (= (_2!9641 lt!328761) (_2!9641 lt!328752))))

(declare-fun lt!328743 () Unit!14917)

(declare-fun Unit!14930 () Unit!14917)

(assert (=> b!209828 (= lt!328743 Unit!14930)))

(assert (=> b!209828 (invariant!0 (currentBit!9648 (_2!9638 lt!328732)) (currentByte!9653 (_2!9638 lt!328732)) (size!4603 (buf!5117 (_2!9638 lt!328732))))))

(declare-fun lt!328734 () Unit!14917)

(declare-fun Unit!14931 () Unit!14917)

(assert (=> b!209828 (= lt!328734 Unit!14931)))

(assert (=> b!209828 (= (size!4603 (buf!5117 (_2!9638 lt!327996))) (size!4603 (buf!5117 (_2!9638 lt!328732))))))

(declare-fun lt!328707 () Unit!14917)

(declare-fun Unit!14932 () Unit!14917)

(assert (=> b!209828 (= lt!328707 Unit!14932)))

(assert (=> b!209828 (= (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328732))) (currentByte!9653 (_2!9638 lt!328732)) (currentBit!9648 (_2!9638 lt!328732))) (bvsub (bvadd (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328728 () Unit!14917)

(declare-fun Unit!14933 () Unit!14917)

(assert (=> b!209828 (= lt!328728 Unit!14933)))

(declare-fun lt!328710 () Unit!14917)

(declare-fun Unit!14934 () Unit!14917)

(assert (=> b!209828 (= lt!328710 Unit!14934)))

(declare-fun lt!328721 () tuple2!17970)

(assert (=> b!209828 (= lt!328721 (reader!0 (_2!9638 lt!327996) (_2!9638 lt!328732)))))

(declare-fun lt!328718 () (_ BitVec 64))

(assert (=> b!209828 (= lt!328718 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!328742 () Unit!14917)

(assert (=> b!209828 (= lt!328742 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9638 lt!327996) (buf!5117 (_2!9638 lt!328732)) lt!328718))))

(assert (=> b!209828 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!328732)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996))) lt!328718)))

(declare-fun lt!328744 () Unit!14917)

(assert (=> b!209828 (= lt!328744 lt!328742)))

(declare-fun lt!328716 () tuple2!17972)

(assert (=> b!209828 (= lt!328716 (readNBitsLSBFirstsLoopPure!0 (_1!9640 lt!328721) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!176168 () Bool)

(assert (=> b!209828 (= res!176168 (= (_2!9641 lt!328716) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!143201 () Bool)

(assert (=> b!209828 (=> (not res!176168) (not e!143201))))

(assert (=> b!209828 e!143201))

(declare-fun lt!328759 () Unit!14917)

(declare-fun Unit!14935 () Unit!14917)

(assert (=> b!209828 (= lt!328759 Unit!14935)))

(declare-fun b!209829 () Bool)

(declare-fun res!176169 () Bool)

(assert (=> b!209829 (= res!176169 call!3300)))

(assert (=> b!209829 (=> (not res!176169) (not e!143205))))

(declare-fun b!209830 () Bool)

(declare-fun res!176171 () Bool)

(assert (=> b!209830 (=> (not res!176171) (not e!143202))))

(assert (=> b!209830 (= res!176171 (= (size!4603 (buf!5117 (_2!9638 lt!327996))) (size!4603 (buf!5117 (_2!9638 lt!328706)))))))

(declare-fun c!10312 () Bool)

(declare-fun bm!3297 () Bool)

(assert (=> bm!3297 (= call!3300 (isPrefixOf!0 (_2!9638 lt!327996) (ite c!10312 (_2!9638 lt!327996) (_2!9638 lt!328760))))))

(declare-fun b!209831 () Bool)

(assert (=> b!209831 (= e!143203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!209833 () Bool)

(assert (=> b!209833 (= e!143203 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!209834 () Bool)

(assert (=> b!209834 (= e!143201 (= (_1!9641 lt!328716) (_2!9640 lt!328721)))))

(declare-fun b!209835 () Bool)

(assert (=> b!209835 (= e!143200 (= (_2!9639 lt!328736) (_2!9639 lt!328714)))))

(declare-fun b!209836 () Bool)

(declare-fun e!143204 () Bool)

(declare-fun lt!328726 () tuple2!17968)

(assert (=> b!209836 (= e!143204 (= (bitIndex!0 (size!4603 (buf!5117 (_1!9639 lt!328726))) (currentByte!9653 (_1!9639 lt!328726)) (currentBit!9648 (_1!9639 lt!328726))) (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328760))) (currentByte!9653 (_2!9638 lt!328760)) (currentBit!9648 (_2!9638 lt!328760)))))))

(declare-fun b!209837 () Bool)

(assert (=> b!209837 (= lt!328726 (readBitPure!0 (readerFrom!0 (_2!9638 lt!328760) (currentBit!9648 (_2!9638 lt!327996)) (currentByte!9653 (_2!9638 lt!327996)))))))

(declare-fun res!176170 () Bool)

(assert (=> b!209837 (= res!176170 (and (= (_2!9639 lt!328726) lt!328720) (= (_1!9639 lt!328726) (_2!9638 lt!328760))))))

(assert (=> b!209837 (=> (not res!176170) (not e!143204))))

(assert (=> b!209837 (= e!143205 e!143204)))

(declare-fun b!209838 () Bool)

(declare-fun res!176166 () Bool)

(assert (=> b!209838 (= res!176166 (= (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328760))) (currentByte!9653 (_2!9638 lt!328760)) (currentBit!9648 (_2!9638 lt!328760))) (bvadd (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!209838 (=> (not res!176166) (not e!143205))))

(declare-fun b!209839 () Bool)

(assert (=> b!209839 (= e!143206 (validate_offset_bits!1 ((_ sign_extend 32) (size!4603 (buf!5117 (_2!9638 lt!327996)))) ((_ sign_extend 32) (currentByte!9653 (_2!9638 lt!327996))) ((_ sign_extend 32) (currentBit!9648 (_2!9638 lt!327996))) lt!328711))))

(declare-fun b!209840 () Bool)

(declare-fun res!176167 () Bool)

(assert (=> b!209840 (=> (not res!176167) (not e!143202))))

(declare-fun lt!328708 () (_ BitVec 64))

(declare-fun lt!328741 () (_ BitVec 64))

(assert (=> b!209840 (= res!176167 (= (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!328706))) (currentByte!9653 (_2!9638 lt!328706)) (currentBit!9648 (_2!9638 lt!328706))) (bvsub lt!328708 lt!328741)))))

(assert (=> b!209840 (or (= (bvand lt!328708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!328708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!328708 lt!328741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209840 (= lt!328741 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!328724 () (_ BitVec 64))

(declare-fun lt!328758 () (_ BitVec 64))

(assert (=> b!209840 (= lt!328708 (bvadd lt!328724 lt!328758))))

(assert (=> b!209840 (or (not (= (bvand lt!328724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!328724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!328724 lt!328758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209840 (= lt!328758 ((_ sign_extend 32) nBits!348))))

(assert (=> b!209840 (= lt!328724 (bitIndex!0 (size!4603 (buf!5117 (_2!9638 lt!327996))) (currentByte!9653 (_2!9638 lt!327996)) (currentBit!9648 (_2!9638 lt!327996))))))

(declare-fun b!209832 () Bool)

(assert (=> b!209832 (= e!143207 (= (_1!9641 lt!328753) (_2!9640 lt!328719)))))

(declare-fun d!70877 () Bool)

(assert (=> d!70877 e!143202))

(declare-fun res!176164 () Bool)

(assert (=> d!70877 (=> (not res!176164) (not e!143202))))

(assert (=> d!70877 (= res!176164 (invariant!0 (currentBit!9648 (_2!9638 lt!328706)) (currentByte!9653 (_2!9638 lt!328706)) (size!4603 (buf!5117 (_2!9638 lt!328706)))))))

(assert (=> d!70877 (= lt!328706 e!143199)))

(assert (=> d!70877 (= c!10312 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70877 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70877 (= (appendBitsLSBFirstLoopTR!0 (_2!9638 lt!327996) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!328706)))

(assert (= (and d!70877 c!10312) b!209827))

(assert (= (and d!70877 (not c!10312)) b!209828))

(assert (= (and b!209828 res!176161) b!209838))

(assert (= (and b!209838 res!176166) b!209829))

(assert (= (and b!209829 res!176169) b!209837))

(assert (= (and b!209837 res!176170) b!209836))

(assert (= (and b!209828 res!176162) b!209835))

(assert (= (and b!209828 c!10311) b!209833))

(assert (= (and b!209828 (not c!10311)) b!209831))

(assert (= (and b!209828 res!176168) b!209834))

(assert (= (or b!209827 b!209829) bm!3297))

(assert (= (and d!70877 res!176164) b!209830))

(assert (= (and b!209830 res!176171) b!209840))

(assert (= (and b!209840 res!176167) b!209825))

(assert (= (and b!209825 res!176160) b!209826))

(assert (= (and b!209826 res!176163) b!209839))

(assert (= (and b!209826 res!176165) b!209832))

(declare-fun m!322887 () Bool)

(assert (=> d!70877 m!322887))

(declare-fun m!322889 () Bool)

(assert (=> b!209838 m!322889))

(assert (=> b!209838 m!322415))

(declare-fun m!322891 () Bool)

(assert (=> bm!3297 m!322891))

(declare-fun m!322893 () Bool)

(assert (=> b!209828 m!322893))

(declare-fun m!322895 () Bool)

(assert (=> b!209828 m!322895))

(declare-fun m!322897 () Bool)

(assert (=> b!209828 m!322897))

(declare-fun m!322899 () Bool)

(assert (=> b!209828 m!322899))

(declare-fun m!322901 () Bool)

(assert (=> b!209828 m!322901))

(assert (=> b!209828 m!322415))

(declare-fun m!322903 () Bool)

(assert (=> b!209828 m!322903))

(declare-fun m!322905 () Bool)

(assert (=> b!209828 m!322905))

(declare-fun m!322907 () Bool)

(assert (=> b!209828 m!322907))

(declare-fun m!322909 () Bool)

(assert (=> b!209828 m!322909))

(declare-fun m!322911 () Bool)

(assert (=> b!209828 m!322911))

(declare-fun m!322913 () Bool)

(assert (=> b!209828 m!322913))

(declare-fun m!322915 () Bool)

(assert (=> b!209828 m!322915))

(declare-fun m!322917 () Bool)

(assert (=> b!209828 m!322917))

(declare-fun m!322919 () Bool)

(assert (=> b!209828 m!322919))

(declare-fun m!322921 () Bool)

(assert (=> b!209828 m!322921))

(declare-fun m!322923 () Bool)

(assert (=> b!209828 m!322923))

(declare-fun m!322925 () Bool)

(assert (=> b!209828 m!322925))

(declare-fun m!322927 () Bool)

(assert (=> b!209828 m!322927))

(declare-fun m!322929 () Bool)

(assert (=> b!209828 m!322929))

(declare-fun m!322931 () Bool)

(assert (=> b!209828 m!322931))

(declare-fun m!322933 () Bool)

(assert (=> b!209828 m!322933))

(assert (=> b!209828 m!322923))

(declare-fun m!322935 () Bool)

(assert (=> b!209828 m!322935))

(declare-fun m!322937 () Bool)

(assert (=> b!209828 m!322937))

(declare-fun m!322939 () Bool)

(assert (=> b!209828 m!322939))

(declare-fun m!322941 () Bool)

(assert (=> b!209828 m!322941))

(declare-fun m!322943 () Bool)

(assert (=> b!209828 m!322943))

(declare-fun m!322945 () Bool)

(assert (=> b!209828 m!322945))

(declare-fun m!322947 () Bool)

(assert (=> b!209828 m!322947))

(declare-fun m!322949 () Bool)

(assert (=> b!209828 m!322949))

(declare-fun m!322951 () Bool)

(assert (=> b!209828 m!322951))

(declare-fun m!322953 () Bool)

(assert (=> b!209828 m!322953))

(declare-fun m!322955 () Bool)

(assert (=> b!209828 m!322955))

(declare-fun m!322957 () Bool)

(assert (=> b!209828 m!322957))

(declare-fun m!322959 () Bool)

(assert (=> b!209826 m!322959))

(declare-fun m!322961 () Bool)

(assert (=> b!209826 m!322961))

(assert (=> b!209826 m!322905))

(declare-fun m!322963 () Bool)

(assert (=> b!209826 m!322963))

(declare-fun m!322965 () Bool)

(assert (=> b!209826 m!322965))

(assert (=> b!209826 m!322927))

(declare-fun m!322967 () Bool)

(assert (=> b!209840 m!322967))

(assert (=> b!209840 m!322415))

(assert (=> b!209827 m!322607))

(declare-fun m!322969 () Bool)

(assert (=> b!209836 m!322969))

(assert (=> b!209836 m!322889))

(declare-fun m!322971 () Bool)

(assert (=> b!209837 m!322971))

(assert (=> b!209837 m!322971))

(declare-fun m!322973 () Bool)

(assert (=> b!209837 m!322973))

(declare-fun m!322975 () Bool)

(assert (=> b!209839 m!322975))

(declare-fun m!322977 () Bool)

(assert (=> b!209825 m!322977))

(assert (=> b!209505 d!70877))

(push 1)

(assert (not b!209689))

(assert (not b!209687))

(assert (not d!70841))

(assert (not b!209839))

(assert (not d!70827))

(assert (not b!209650))

(assert (not d!70823))

(assert (not d!70859))

(assert (not d!70847))

(assert (not b!209838))

(assert (not d!70853))

(assert (not d!70863))

(assert (not b!209840))

(assert (not b!209681))

(assert (not d!70817))

(assert (not b!209651))

(assert (not b!209678))

(assert (not b!209647))

(assert (not b!209684))

(assert (not d!70835))

(assert (not b!209648))

(assert (not b!209631))

(assert (not d!70813))

(assert (not b!209668))

(assert (not d!70805))

(assert (not d!70803))

(assert (not d!70873))

(assert (not d!70851))

(assert (not d!70831))

(assert (not b!209656))

(assert (not b!209680))

(assert (not d!70837))

(assert (not b!209827))

(assert (not d!70843))

(assert (not d!70819))

(assert (not d!70869))

(assert (not b!209655))

(assert (not d!70845))

(assert (not d!70849))

(assert (not d!70867))

(assert (not b!209658))

(assert (not b!209828))

(assert (not d!70877))

(assert (not b!209679))

(assert (not b!209836))

(assert (not d!70839))

(assert (not d!70865))

(assert (not bm!3297))

(assert (not d!70825))

(assert (not b!209826))

(assert (not b!209825))

(assert (not b!209659))

(assert (not d!70815))

(assert (not d!70833))

(assert (not b!209666))

(assert (not b!209837))

(assert (not b!209633))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

