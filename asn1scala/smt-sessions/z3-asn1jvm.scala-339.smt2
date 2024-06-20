; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7936 () Bool)

(assert start!7936)

(declare-fun b!39537 () Bool)

(declare-fun e!26054 () Bool)

(declare-fun e!26052 () Bool)

(assert (=> b!39537 (= e!26054 e!26052)))

(declare-fun res!33641 () Bool)

(assert (=> b!39537 (=> res!33641 e!26052)))

(declare-datatypes ((array!1987 0))(
  ( (array!1988 (arr!1392 (Array (_ BitVec 32) (_ BitVec 8))) (size!896 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1542 0))(
  ( (BitStream!1543 (buf!1224 array!1987) (currentByte!2636 (_ BitVec 32)) (currentBit!2631 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1542)

(declare-datatypes ((Unit!2813 0))(
  ( (Unit!2814) )
))
(declare-datatypes ((tuple2!3820 0))(
  ( (tuple2!3821 (_1!1997 Unit!2813) (_2!1997 BitStream!1542)) )
))
(declare-fun lt!59985 () tuple2!3820)

(declare-fun isPrefixOf!0 (BitStream!1542 BitStream!1542) Bool)

(assert (=> b!39537 (= res!33641 (not (isPrefixOf!0 thiss!1379 (_2!1997 lt!59985))))))

(declare-fun lt!59968 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39537 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!59968)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!39537 (= lt!59968 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59987 () Unit!2813)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1542 BitStream!1542 (_ BitVec 64) (_ BitVec 64)) Unit!2813)

(assert (=> b!39537 (= lt!59987 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1997 lt!59985) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1987)

(declare-fun appendBitFromByte!0 (BitStream!1542 (_ BitVec 8) (_ BitVec 32)) tuple2!3820)

(assert (=> b!39537 (= lt!59985 (appendBitFromByte!0 thiss!1379 (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!39538 () Bool)

(declare-fun res!33657 () Bool)

(declare-fun e!26057 () Bool)

(assert (=> b!39538 (=> res!33657 e!26057)))

(declare-fun lt!59978 () tuple2!3820)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!39538 (= res!33657 (not (invariant!0 (currentBit!2631 (_2!1997 lt!59985)) (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59978))))))))

(declare-fun b!39539 () Bool)

(declare-datatypes ((tuple2!3822 0))(
  ( (tuple2!3823 (_1!1998 BitStream!1542) (_2!1998 BitStream!1542)) )
))
(declare-fun lt!59982 () tuple2!3822)

(declare-fun e!26060 () Bool)

(assert (=> b!39539 (= e!26060 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_1!1998 lt!59982)))) ((_ sign_extend 32) (currentByte!2636 (_1!1998 lt!59982))) ((_ sign_extend 32) (currentBit!2631 (_1!1998 lt!59982))) (bvsub to!314 i!635)))))

(declare-fun b!39540 () Bool)

(declare-fun res!33640 () Bool)

(declare-fun e!26049 () Bool)

(assert (=> b!39540 (=> (not res!33640) (not e!26049))))

(assert (=> b!39540 (= res!33640 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 thiss!1379))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!39541 () Bool)

(declare-fun e!26059 () Bool)

(declare-fun array_inv!824 (array!1987) Bool)

(assert (=> b!39541 (= e!26059 (array_inv!824 (buf!1224 thiss!1379)))))

(declare-fun b!39542 () Bool)

(declare-fun e!26056 () Bool)

(declare-fun e!26053 () Bool)

(assert (=> b!39542 (= e!26056 e!26053)))

(declare-fun res!33658 () Bool)

(assert (=> b!39542 (=> res!33658 e!26053)))

(declare-fun lt!59980 () (_ BitVec 64))

(declare-fun lt!59981 () (_ BitVec 64))

(assert (=> b!39542 (= res!33658 (not (= lt!59980 (bvsub (bvadd lt!59981 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!39542 (= lt!59980 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59978))) (currentByte!2636 (_2!1997 lt!59978)) (currentBit!2631 (_2!1997 lt!59978))))))

(declare-fun b!39543 () Bool)

(declare-fun res!33642 () Bool)

(assert (=> b!39543 (=> res!33642 e!26053)))

(assert (=> b!39543 (= res!33642 (not (invariant!0 (currentBit!2631 (_2!1997 lt!59978)) (currentByte!2636 (_2!1997 lt!59978)) (size!896 (buf!1224 (_2!1997 lt!59978))))))))

(declare-fun b!39544 () Bool)

(declare-fun e!26055 () Bool)

(declare-fun e!26051 () Bool)

(assert (=> b!39544 (= e!26055 e!26051)))

(declare-fun res!33660 () Bool)

(assert (=> b!39544 (=> res!33660 e!26051)))

(declare-fun lt!59969 () tuple2!3822)

(declare-fun lt!59975 () Bool)

(declare-fun bitAt!0 (array!1987 (_ BitVec 64)) Bool)

(assert (=> b!39544 (= res!33660 (not (= lt!59975 (bitAt!0 (buf!1224 (_1!1998 lt!59969)) lt!59981))))))

(assert (=> b!39544 (= lt!59975 (bitAt!0 (buf!1224 (_1!1998 lt!59982)) lt!59981))))

(declare-fun b!39545 () Bool)

(declare-fun e!26061 () Bool)

(declare-fun e!26062 () Bool)

(assert (=> b!39545 (= e!26061 e!26062)))

(declare-fun res!33655 () Bool)

(assert (=> b!39545 (=> res!33655 e!26062)))

(declare-fun lt!59992 () Bool)

(declare-fun lt!59984 () Bool)

(assert (=> b!39545 (= res!33655 (not (= lt!59992 lt!59984)))))

(assert (=> b!39545 (= lt!59984 (bitAt!0 srcBuffer!2 i!635))))

(declare-datatypes ((List!472 0))(
  ( (Nil!469) (Cons!468 (h!587 Bool) (t!1222 List!472)) )
))
(declare-fun head!309 (List!472) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1542 array!1987 (_ BitVec 64) (_ BitVec 64)) List!472)

(assert (=> b!39545 (= lt!59992 (head!309 (byteArrayBitContentToList!0 (_2!1997 lt!59978) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!39546 () Bool)

(declare-fun res!33654 () Bool)

(assert (=> b!39546 (=> res!33654 e!26057)))

(assert (=> b!39546 (= res!33654 (not (invariant!0 (currentBit!2631 (_2!1997 lt!59985)) (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59985))))))))

(declare-fun b!39548 () Bool)

(declare-fun e!26058 () Bool)

(assert (=> b!39548 (= e!26058 e!26055)))

(declare-fun res!33656 () Bool)

(assert (=> b!39548 (=> res!33656 e!26055)))

(declare-fun lt!59972 () List!472)

(declare-fun lt!59977 () List!472)

(assert (=> b!39548 (= res!33656 (not (= lt!59972 lt!59977)))))

(assert (=> b!39548 (= lt!59977 lt!59972)))

(declare-fun lt!59973 () List!472)

(declare-fun tail!189 (List!472) List!472)

(assert (=> b!39548 (= lt!59972 (tail!189 lt!59973))))

(declare-fun lt!59979 () Unit!2813)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1542 BitStream!1542 BitStream!1542 BitStream!1542 (_ BitVec 64) List!472) Unit!2813)

(assert (=> b!39548 (= lt!59979 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1997 lt!59978) (_2!1997 lt!59978) (_1!1998 lt!59982) (_1!1998 lt!59969) (bvsub to!314 i!635) lt!59973))))

(declare-fun b!39549 () Bool)

(assert (=> b!39549 (= e!26052 e!26056)))

(declare-fun res!33649 () Bool)

(assert (=> b!39549 (=> res!33649 e!26056)))

(assert (=> b!39549 (= res!33649 (not (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!59978))))))

(assert (=> b!39549 (isPrefixOf!0 thiss!1379 (_2!1997 lt!59978))))

(declare-fun lt!59971 () Unit!2813)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1542 BitStream!1542 BitStream!1542) Unit!2813)

(assert (=> b!39549 (= lt!59971 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1997 lt!59985) (_2!1997 lt!59978)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1542 array!1987 (_ BitVec 64) (_ BitVec 64)) tuple2!3820)

(assert (=> b!39549 (= lt!59978 (appendBitsMSBFirstLoop!0 (_2!1997 lt!59985) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!26064 () Bool)

(assert (=> b!39549 e!26064))

(declare-fun res!33639 () Bool)

(assert (=> b!39549 (=> (not res!33639) (not e!26064))))

(assert (=> b!39549 (= res!33639 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59983 () Unit!2813)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1542 array!1987 (_ BitVec 64)) Unit!2813)

(assert (=> b!39549 (= lt!59983 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1224 (_2!1997 lt!59985)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59989 () tuple2!3822)

(declare-fun reader!0 (BitStream!1542 BitStream!1542) tuple2!3822)

(assert (=> b!39549 (= lt!59989 (reader!0 thiss!1379 (_2!1997 lt!59985)))))

(declare-fun b!39550 () Bool)

(declare-fun res!33647 () Bool)

(assert (=> b!39550 (=> res!33647 e!26060)))

(declare-fun lt!59974 () Bool)

(assert (=> b!39550 (= res!33647 (not (= lt!59974 lt!59992)))))

(declare-fun b!39551 () Bool)

(declare-fun res!33645 () Bool)

(assert (=> b!39551 (=> res!33645 e!26060)))

(declare-datatypes ((tuple2!3824 0))(
  ( (tuple2!3825 (_1!1999 BitStream!1542) (_2!1999 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1542) tuple2!3824)

(assert (=> b!39551 (= res!33645 (not (= (_2!1999 (readBitPure!0 (_1!1998 lt!59982))) lt!59984)))))

(declare-fun b!39552 () Bool)

(assert (=> b!39552 (= e!26049 (not e!26054))))

(declare-fun res!33651 () Bool)

(assert (=> b!39552 (=> res!33651 e!26054)))

(assert (=> b!39552 (= res!33651 (bvsge i!635 to!314))))

(assert (=> b!39552 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59967 () Unit!2813)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1542) Unit!2813)

(assert (=> b!39552 (= lt!59967 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!39552 (= lt!59981 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(declare-fun b!39553 () Bool)

(declare-fun e!26065 () Bool)

(assert (=> b!39553 (= e!26062 e!26065)))

(declare-fun res!33650 () Bool)

(assert (=> b!39553 (=> res!33650 e!26065)))

(declare-fun lt!59990 () Bool)

(assert (=> b!39553 (= res!33650 (not (= lt!59990 lt!59984)))))

(assert (=> b!39553 (= lt!59990 (bitAt!0 (buf!1224 (_2!1997 lt!59985)) lt!59981))))

(declare-fun b!39554 () Bool)

(assert (=> b!39554 (= e!26057 e!26058)))

(declare-fun res!33653 () Bool)

(assert (=> b!39554 (=> res!33653 e!26058)))

(assert (=> b!39554 (= res!33653 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1542 BitStream!1542 (_ BitVec 64)) List!472)

(assert (=> b!39554 (= lt!59977 (bitStreamReadBitsIntoList!0 (_2!1997 lt!59978) (_1!1998 lt!59969) lt!59968))))

(assert (=> b!39554 (= lt!59973 (bitStreamReadBitsIntoList!0 (_2!1997 lt!59978) (_1!1998 lt!59982) (bvsub to!314 i!635)))))

(assert (=> b!39554 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!59968)))

(declare-fun lt!59988 () Unit!2813)

(assert (=> b!39554 (= lt!59988 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1997 lt!59985) (buf!1224 (_2!1997 lt!59978)) lt!59968))))

(assert (=> b!39554 (= lt!59969 (reader!0 (_2!1997 lt!59985) (_2!1997 lt!59978)))))

(assert (=> b!39554 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59976 () Unit!2813)

(assert (=> b!39554 (= lt!59976 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1224 (_2!1997 lt!59978)) (bvsub to!314 i!635)))))

(assert (=> b!39554 (= lt!59982 (reader!0 thiss!1379 (_2!1997 lt!59978)))))

(declare-fun b!39555 () Bool)

(assert (=> b!39555 (= e!26065 e!26060)))

(declare-fun res!33659 () Bool)

(assert (=> b!39555 (=> res!33659 e!26060)))

(declare-fun lt!59991 () Bool)

(assert (=> b!39555 (= res!33659 (not (= lt!59991 lt!59984)))))

(assert (=> b!39555 (= lt!59990 lt!59991)))

(assert (=> b!39555 (= lt!59991 (bitAt!0 (buf!1224 (_2!1997 lt!59978)) lt!59981))))

(declare-fun lt!59970 () (_ BitVec 64))

(declare-fun lt!59986 () Unit!2813)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1987 array!1987 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2813)

(assert (=> b!39555 (= lt!59986 (arrayBitRangesEqImpliesEq!0 (buf!1224 (_2!1997 lt!59985)) (buf!1224 (_2!1997 lt!59978)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59981 lt!59970))))

(declare-fun b!39556 () Bool)

(assert (=> b!39556 (= e!26051 e!26061)))

(declare-fun res!33644 () Bool)

(assert (=> b!39556 (=> res!33644 e!26061)))

(assert (=> b!39556 (= res!33644 (not (= lt!59974 lt!59975)))))

(assert (=> b!39556 (= lt!59974 (head!309 lt!59973))))

(declare-fun b!39557 () Bool)

(declare-fun res!33652 () Bool)

(assert (=> b!39557 (=> res!33652 e!26053)))

(assert (=> b!39557 (= res!33652 (not (= (size!896 (buf!1224 thiss!1379)) (size!896 (buf!1224 (_2!1997 lt!59978))))))))

(declare-fun b!39558 () Bool)

(assert (=> b!39558 (= e!26064 (= (head!309 (byteArrayBitContentToList!0 (_2!1997 lt!59985) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!309 (bitStreamReadBitsIntoList!0 (_2!1997 lt!59985) (_1!1998 lt!59989) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!39559 () Bool)

(declare-fun res!33643 () Bool)

(assert (=> b!39559 (=> res!33643 e!26058)))

(declare-fun length!198 (List!472) Int)

(assert (=> b!39559 (= res!33643 (<= (length!198 lt!59973) 0))))

(declare-fun res!33646 () Bool)

(assert (=> start!7936 (=> (not res!33646) (not e!26049))))

(assert (=> start!7936 (= res!33646 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!896 srcBuffer!2))))))))

(assert (=> start!7936 e!26049))

(assert (=> start!7936 true))

(assert (=> start!7936 (array_inv!824 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1542) Bool)

(assert (=> start!7936 (and (inv!12 thiss!1379) e!26059)))

(declare-fun b!39547 () Bool)

(assert (=> b!39547 (= e!26053 e!26057)))

(declare-fun res!33648 () Bool)

(assert (=> b!39547 (=> res!33648 e!26057)))

(assert (=> b!39547 (= res!33648 (not (= (size!896 (buf!1224 (_2!1997 lt!59985))) (size!896 (buf!1224 (_2!1997 lt!59978))))))))

(assert (=> b!39547 (= lt!59980 (bvsub (bvsub (bvadd lt!59970 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39547 (= lt!59970 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))))))

(assert (=> b!39547 (= (size!896 (buf!1224 (_2!1997 lt!59978))) (size!896 (buf!1224 thiss!1379)))))

(assert (= (and start!7936 res!33646) b!39540))

(assert (= (and b!39540 res!33640) b!39552))

(assert (= (and b!39552 (not res!33651)) b!39537))

(assert (= (and b!39537 (not res!33641)) b!39549))

(assert (= (and b!39549 res!33639) b!39558))

(assert (= (and b!39549 (not res!33649)) b!39542))

(assert (= (and b!39542 (not res!33658)) b!39543))

(assert (= (and b!39543 (not res!33642)) b!39557))

(assert (= (and b!39557 (not res!33652)) b!39547))

(assert (= (and b!39547 (not res!33648)) b!39546))

(assert (= (and b!39546 (not res!33654)) b!39538))

(assert (= (and b!39538 (not res!33657)) b!39554))

(assert (= (and b!39554 (not res!33653)) b!39559))

(assert (= (and b!39559 (not res!33643)) b!39548))

(assert (= (and b!39548 (not res!33656)) b!39544))

(assert (= (and b!39544 (not res!33660)) b!39556))

(assert (= (and b!39556 (not res!33644)) b!39545))

(assert (= (and b!39545 (not res!33655)) b!39553))

(assert (= (and b!39553 (not res!33650)) b!39555))

(assert (= (and b!39555 (not res!33659)) b!39551))

(assert (= (and b!39551 (not res!33645)) b!39550))

(assert (= (and b!39550 (not res!33647)) b!39539))

(assert (= start!7936 b!39541))

(declare-fun m!60265 () Bool)

(assert (=> b!39555 m!60265))

(declare-fun m!60267 () Bool)

(assert (=> b!39555 m!60267))

(declare-fun m!60269 () Bool)

(assert (=> b!39539 m!60269))

(declare-fun m!60271 () Bool)

(assert (=> b!39544 m!60271))

(declare-fun m!60273 () Bool)

(assert (=> b!39544 m!60273))

(declare-fun m!60275 () Bool)

(assert (=> b!39545 m!60275))

(declare-fun m!60277 () Bool)

(assert (=> b!39545 m!60277))

(assert (=> b!39545 m!60277))

(declare-fun m!60279 () Bool)

(assert (=> b!39545 m!60279))

(declare-fun m!60281 () Bool)

(assert (=> b!39556 m!60281))

(declare-fun m!60283 () Bool)

(assert (=> b!39559 m!60283))

(declare-fun m!60285 () Bool)

(assert (=> b!39552 m!60285))

(declare-fun m!60287 () Bool)

(assert (=> b!39552 m!60287))

(declare-fun m!60289 () Bool)

(assert (=> b!39552 m!60289))

(declare-fun m!60291 () Bool)

(assert (=> b!39542 m!60291))

(declare-fun m!60293 () Bool)

(assert (=> b!39548 m!60293))

(declare-fun m!60295 () Bool)

(assert (=> b!39548 m!60295))

(declare-fun m!60297 () Bool)

(assert (=> b!39546 m!60297))

(declare-fun m!60299 () Bool)

(assert (=> b!39541 m!60299))

(declare-fun m!60301 () Bool)

(assert (=> b!39540 m!60301))

(declare-fun m!60303 () Bool)

(assert (=> b!39543 m!60303))

(declare-fun m!60305 () Bool)

(assert (=> b!39551 m!60305))

(declare-fun m!60307 () Bool)

(assert (=> start!7936 m!60307))

(declare-fun m!60309 () Bool)

(assert (=> start!7936 m!60309))

(declare-fun m!60311 () Bool)

(assert (=> b!39558 m!60311))

(assert (=> b!39558 m!60311))

(declare-fun m!60313 () Bool)

(assert (=> b!39558 m!60313))

(declare-fun m!60315 () Bool)

(assert (=> b!39558 m!60315))

(assert (=> b!39558 m!60315))

(declare-fun m!60317 () Bool)

(assert (=> b!39558 m!60317))

(declare-fun m!60319 () Bool)

(assert (=> b!39549 m!60319))

(declare-fun m!60321 () Bool)

(assert (=> b!39549 m!60321))

(declare-fun m!60323 () Bool)

(assert (=> b!39549 m!60323))

(declare-fun m!60325 () Bool)

(assert (=> b!39549 m!60325))

(declare-fun m!60327 () Bool)

(assert (=> b!39549 m!60327))

(declare-fun m!60329 () Bool)

(assert (=> b!39549 m!60329))

(declare-fun m!60331 () Bool)

(assert (=> b!39549 m!60331))

(declare-fun m!60333 () Bool)

(assert (=> b!39538 m!60333))

(declare-fun m!60335 () Bool)

(assert (=> b!39537 m!60335))

(declare-fun m!60337 () Bool)

(assert (=> b!39537 m!60337))

(declare-fun m!60339 () Bool)

(assert (=> b!39537 m!60339))

(assert (=> b!39537 m!60337))

(declare-fun m!60341 () Bool)

(assert (=> b!39537 m!60341))

(declare-fun m!60343 () Bool)

(assert (=> b!39537 m!60343))

(declare-fun m!60345 () Bool)

(assert (=> b!39547 m!60345))

(declare-fun m!60347 () Bool)

(assert (=> b!39553 m!60347))

(declare-fun m!60349 () Bool)

(assert (=> b!39554 m!60349))

(declare-fun m!60351 () Bool)

(assert (=> b!39554 m!60351))

(declare-fun m!60353 () Bool)

(assert (=> b!39554 m!60353))

(declare-fun m!60355 () Bool)

(assert (=> b!39554 m!60355))

(declare-fun m!60357 () Bool)

(assert (=> b!39554 m!60357))

(declare-fun m!60359 () Bool)

(assert (=> b!39554 m!60359))

(declare-fun m!60361 () Bool)

(assert (=> b!39554 m!60361))

(declare-fun m!60363 () Bool)

(assert (=> b!39554 m!60363))

(check-sat (not b!39543) (not b!39546) (not b!39545) (not b!39548) (not b!39549) (not b!39538) (not b!39553) (not b!39541) (not b!39542) (not b!39559) (not b!39547) (not b!39544) (not b!39539) (not b!39554) (not b!39558) (not b!39555) (not b!39540) (not start!7936) (not b!39552) (not b!39556) (not b!39537) (not b!39551))
(check-sat)
(get-model)

(declare-fun d!11628 () Bool)

(assert (=> d!11628 (= (array_inv!824 (buf!1224 thiss!1379)) (bvsge (size!896 (buf!1224 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!39541 d!11628))

(declare-fun d!11630 () Bool)

(declare-datatypes ((tuple2!3832 0))(
  ( (tuple2!3833 (_1!2003 Bool) (_2!2003 BitStream!1542)) )
))
(declare-fun lt!60073 () tuple2!3832)

(declare-fun readBit!0 (BitStream!1542) tuple2!3832)

(assert (=> d!11630 (= lt!60073 (readBit!0 (_1!1998 lt!59982)))))

(assert (=> d!11630 (= (readBitPure!0 (_1!1998 lt!59982)) (tuple2!3825 (_2!2003 lt!60073) (_1!2003 lt!60073)))))

(declare-fun bs!3095 () Bool)

(assert (= bs!3095 d!11630))

(declare-fun m!60465 () Bool)

(assert (=> bs!3095 m!60465))

(assert (=> b!39551 d!11630))

(declare-fun d!11632 () Bool)

(assert (=> d!11632 (= (array_inv!824 srcBuffer!2) (bvsge (size!896 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7936 d!11632))

(declare-fun d!11634 () Bool)

(assert (=> d!11634 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2631 thiss!1379) (currentByte!2636 thiss!1379) (size!896 (buf!1224 thiss!1379))))))

(declare-fun bs!3096 () Bool)

(assert (= bs!3096 d!11634))

(declare-fun m!60467 () Bool)

(assert (=> bs!3096 m!60467))

(assert (=> start!7936 d!11634))

(declare-fun d!11636 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11636 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 thiss!1379))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 thiss!1379))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3097 () Bool)

(assert (= bs!3097 d!11636))

(declare-fun m!60469 () Bool)

(assert (=> bs!3097 m!60469))

(assert (=> b!39540 d!11636))

(declare-fun d!11638 () Bool)

(assert (=> d!11638 (= (bitAt!0 (buf!1224 (_2!1997 lt!59985)) lt!59981) (not (= (bvand ((_ sign_extend 24) (select (arr!1392 (buf!1224 (_2!1997 lt!59985))) ((_ extract 31 0) (bvsdiv lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3098 () Bool)

(assert (= bs!3098 d!11638))

(declare-fun m!60471 () Bool)

(assert (=> bs!3098 m!60471))

(declare-fun m!60473 () Bool)

(assert (=> bs!3098 m!60473))

(assert (=> b!39553 d!11638))

(declare-fun d!11640 () Bool)

(declare-fun e!26119 () Bool)

(assert (=> d!11640 e!26119))

(declare-fun res!33732 () Bool)

(assert (=> d!11640 (=> (not res!33732) (not e!26119))))

(declare-fun lt!60090 () (_ BitVec 64))

(declare-fun lt!60091 () (_ BitVec 64))

(declare-fun lt!60086 () (_ BitVec 64))

(assert (=> d!11640 (= res!33732 (= lt!60091 (bvsub lt!60090 lt!60086)))))

(assert (=> d!11640 (or (= (bvand lt!60090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60090 lt!60086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11640 (= lt!60086 (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59978))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59978)))))))

(declare-fun lt!60089 () (_ BitVec 64))

(declare-fun lt!60087 () (_ BitVec 64))

(assert (=> d!11640 (= lt!60090 (bvmul lt!60089 lt!60087))))

(assert (=> d!11640 (or (= lt!60089 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!60087 (bvsdiv (bvmul lt!60089 lt!60087) lt!60089)))))

(assert (=> d!11640 (= lt!60087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11640 (= lt!60089 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))))))

(assert (=> d!11640 (= lt!60091 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59978))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59978)))))))

(assert (=> d!11640 (invariant!0 (currentBit!2631 (_2!1997 lt!59978)) (currentByte!2636 (_2!1997 lt!59978)) (size!896 (buf!1224 (_2!1997 lt!59978))))))

(assert (=> d!11640 (= (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59978))) (currentByte!2636 (_2!1997 lt!59978)) (currentBit!2631 (_2!1997 lt!59978))) lt!60091)))

(declare-fun b!39633 () Bool)

(declare-fun res!33731 () Bool)

(assert (=> b!39633 (=> (not res!33731) (not e!26119))))

(assert (=> b!39633 (= res!33731 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!60091))))

(declare-fun b!39634 () Bool)

(declare-fun lt!60088 () (_ BitVec 64))

(assert (=> b!39634 (= e!26119 (bvsle lt!60091 (bvmul lt!60088 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!39634 (or (= lt!60088 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!60088 #b0000000000000000000000000000000000000000000000000000000000001000) lt!60088)))))

(assert (=> b!39634 (= lt!60088 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))))))

(assert (= (and d!11640 res!33732) b!39633))

(assert (= (and b!39633 res!33731) b!39634))

(declare-fun m!60475 () Bool)

(assert (=> d!11640 m!60475))

(assert (=> d!11640 m!60303))

(assert (=> b!39542 d!11640))

(declare-fun d!11642 () Bool)

(declare-fun res!33739 () Bool)

(declare-fun e!26125 () Bool)

(assert (=> d!11642 (=> (not res!33739) (not e!26125))))

(assert (=> d!11642 (= res!33739 (= (size!896 (buf!1224 thiss!1379)) (size!896 (buf!1224 thiss!1379))))))

(assert (=> d!11642 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!26125)))

(declare-fun b!39641 () Bool)

(declare-fun res!33741 () Bool)

(assert (=> b!39641 (=> (not res!33741) (not e!26125))))

(assert (=> b!39641 (= res!33741 (bvsle (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)) (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379))))))

(declare-fun b!39642 () Bool)

(declare-fun e!26124 () Bool)

(assert (=> b!39642 (= e!26125 e!26124)))

(declare-fun res!33740 () Bool)

(assert (=> b!39642 (=> res!33740 e!26124)))

(assert (=> b!39642 (= res!33740 (= (size!896 (buf!1224 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39643 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1987 array!1987 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39643 (= e!26124 (arrayBitRangesEq!0 (buf!1224 thiss!1379) (buf!1224 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379))))))

(assert (= (and d!11642 res!33739) b!39641))

(assert (= (and b!39641 res!33741) b!39642))

(assert (= (and b!39642 (not res!33740)) b!39643))

(assert (=> b!39641 m!60289))

(assert (=> b!39641 m!60289))

(assert (=> b!39643 m!60289))

(assert (=> b!39643 m!60289))

(declare-fun m!60477 () Bool)

(assert (=> b!39643 m!60477))

(assert (=> b!39552 d!11642))

(declare-fun d!11644 () Bool)

(assert (=> d!11644 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!60094 () Unit!2813)

(declare-fun choose!11 (BitStream!1542) Unit!2813)

(assert (=> d!11644 (= lt!60094 (choose!11 thiss!1379))))

(assert (=> d!11644 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!60094)))

(declare-fun bs!3100 () Bool)

(assert (= bs!3100 d!11644))

(assert (=> bs!3100 m!60285))

(declare-fun m!60479 () Bool)

(assert (=> bs!3100 m!60479))

(assert (=> b!39552 d!11644))

(declare-fun d!11646 () Bool)

(declare-fun e!26126 () Bool)

(assert (=> d!11646 e!26126))

(declare-fun res!33743 () Bool)

(assert (=> d!11646 (=> (not res!33743) (not e!26126))))

(declare-fun lt!60095 () (_ BitVec 64))

(declare-fun lt!60099 () (_ BitVec 64))

(declare-fun lt!60100 () (_ BitVec 64))

(assert (=> d!11646 (= res!33743 (= lt!60100 (bvsub lt!60099 lt!60095)))))

(assert (=> d!11646 (or (= (bvand lt!60099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60099 lt!60095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11646 (= lt!60095 (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 thiss!1379))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379))))))

(declare-fun lt!60098 () (_ BitVec 64))

(declare-fun lt!60096 () (_ BitVec 64))

(assert (=> d!11646 (= lt!60099 (bvmul lt!60098 lt!60096))))

(assert (=> d!11646 (or (= lt!60098 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!60096 (bvsdiv (bvmul lt!60098 lt!60096) lt!60098)))))

(assert (=> d!11646 (= lt!60096 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11646 (= lt!60098 ((_ sign_extend 32) (size!896 (buf!1224 thiss!1379))))))

(assert (=> d!11646 (= lt!60100 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2636 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2631 thiss!1379))))))

(assert (=> d!11646 (invariant!0 (currentBit!2631 thiss!1379) (currentByte!2636 thiss!1379) (size!896 (buf!1224 thiss!1379)))))

(assert (=> d!11646 (= (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)) lt!60100)))

(declare-fun b!39644 () Bool)

(declare-fun res!33742 () Bool)

(assert (=> b!39644 (=> (not res!33742) (not e!26126))))

(assert (=> b!39644 (= res!33742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!60100))))

(declare-fun b!39645 () Bool)

(declare-fun lt!60097 () (_ BitVec 64))

(assert (=> b!39645 (= e!26126 (bvsle lt!60100 (bvmul lt!60097 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!39645 (or (= lt!60097 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!60097 #b0000000000000000000000000000000000000000000000000000000000001000) lt!60097)))))

(assert (=> b!39645 (= lt!60097 ((_ sign_extend 32) (size!896 (buf!1224 thiss!1379))))))

(assert (= (and d!11646 res!33743) b!39644))

(assert (= (and b!39644 res!33742) b!39645))

(assert (=> d!11646 m!60469))

(assert (=> d!11646 m!60467))

(assert (=> b!39552 d!11646))

(declare-fun d!11648 () Bool)

(assert (=> d!11648 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!59968)))

(declare-fun lt!60103 () Unit!2813)

(declare-fun choose!9 (BitStream!1542 array!1987 (_ BitVec 64) BitStream!1542) Unit!2813)

(assert (=> d!11648 (= lt!60103 (choose!9 (_2!1997 lt!59985) (buf!1224 (_2!1997 lt!59978)) lt!59968 (BitStream!1543 (buf!1224 (_2!1997 lt!59978)) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985)))))))

(assert (=> d!11648 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1997 lt!59985) (buf!1224 (_2!1997 lt!59978)) lt!59968) lt!60103)))

(declare-fun bs!3101 () Bool)

(assert (= bs!3101 d!11648))

(assert (=> bs!3101 m!60363))

(declare-fun m!60481 () Bool)

(assert (=> bs!3101 m!60481))

(assert (=> b!39554 d!11648))

(declare-fun b!39657 () Bool)

(declare-fun e!26131 () Bool)

(declare-fun lt!60110 () List!472)

(assert (=> b!39657 (= e!26131 (> (length!198 lt!60110) 0))))

(declare-fun d!11650 () Bool)

(assert (=> d!11650 e!26131))

(declare-fun c!2690 () Bool)

(assert (=> d!11650 (= c!2690 (= lt!59968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3834 0))(
  ( (tuple2!3835 (_1!2004 List!472) (_2!2004 BitStream!1542)) )
))
(declare-fun e!26132 () tuple2!3834)

(assert (=> d!11650 (= lt!60110 (_1!2004 e!26132))))

(declare-fun c!2691 () Bool)

(assert (=> d!11650 (= c!2691 (= lt!59968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11650 (bvsge lt!59968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11650 (= (bitStreamReadBitsIntoList!0 (_2!1997 lt!59978) (_1!1998 lt!59969) lt!59968) lt!60110)))

(declare-fun lt!60112 () tuple2!3832)

(declare-fun lt!60111 () (_ BitVec 64))

(declare-fun b!39655 () Bool)

(assert (=> b!39655 (= e!26132 (tuple2!3835 (Cons!468 (_1!2003 lt!60112) (bitStreamReadBitsIntoList!0 (_2!1997 lt!59978) (_2!2003 lt!60112) (bvsub lt!59968 lt!60111))) (_2!2003 lt!60112)))))

(assert (=> b!39655 (= lt!60112 (readBit!0 (_1!1998 lt!59969)))))

(assert (=> b!39655 (= lt!60111 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39654 () Bool)

(assert (=> b!39654 (= e!26132 (tuple2!3835 Nil!469 (_1!1998 lt!59969)))))

(declare-fun b!39656 () Bool)

(declare-fun isEmpty!111 (List!472) Bool)

(assert (=> b!39656 (= e!26131 (isEmpty!111 lt!60110))))

(assert (= (and d!11650 c!2691) b!39654))

(assert (= (and d!11650 (not c!2691)) b!39655))

(assert (= (and d!11650 c!2690) b!39656))

(assert (= (and d!11650 (not c!2690)) b!39657))

(declare-fun m!60483 () Bool)

(assert (=> b!39657 m!60483))

(declare-fun m!60485 () Bool)

(assert (=> b!39655 m!60485))

(declare-fun m!60487 () Bool)

(assert (=> b!39655 m!60487))

(declare-fun m!60489 () Bool)

(assert (=> b!39656 m!60489))

(assert (=> b!39554 d!11650))

(declare-fun d!11652 () Bool)

(assert (=> d!11652 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!60113 () Unit!2813)

(assert (=> d!11652 (= lt!60113 (choose!9 thiss!1379 (buf!1224 (_2!1997 lt!59978)) (bvsub to!314 i!635) (BitStream!1543 (buf!1224 (_2!1997 lt!59978)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379))))))

(assert (=> d!11652 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1224 (_2!1997 lt!59978)) (bvsub to!314 i!635)) lt!60113)))

(declare-fun bs!3102 () Bool)

(assert (= bs!3102 d!11652))

(assert (=> bs!3102 m!60353))

(declare-fun m!60491 () Bool)

(assert (=> bs!3102 m!60491))

(assert (=> b!39554 d!11652))

(declare-fun b!39668 () Bool)

(declare-fun e!26138 () Unit!2813)

(declare-fun lt!60162 () Unit!2813)

(assert (=> b!39668 (= e!26138 lt!60162)))

(declare-fun lt!60157 () (_ BitVec 64))

(assert (=> b!39668 (= lt!60157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60165 () (_ BitVec 64))

(assert (=> b!39668 (= lt!60165 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1987 array!1987 (_ BitVec 64) (_ BitVec 64)) Unit!2813)

(assert (=> b!39668 (= lt!60162 (arrayBitRangesEqSymmetric!0 (buf!1224 thiss!1379) (buf!1224 (_2!1997 lt!59978)) lt!60157 lt!60165))))

(assert (=> b!39668 (arrayBitRangesEq!0 (buf!1224 (_2!1997 lt!59978)) (buf!1224 thiss!1379) lt!60157 lt!60165)))

(declare-fun b!39669 () Bool)

(declare-fun res!33751 () Bool)

(declare-fun e!26137 () Bool)

(assert (=> b!39669 (=> (not res!33751) (not e!26137))))

(declare-fun lt!60171 () tuple2!3822)

(assert (=> b!39669 (= res!33751 (isPrefixOf!0 (_1!1998 lt!60171) thiss!1379))))

(declare-fun b!39670 () Bool)

(declare-fun res!33750 () Bool)

(assert (=> b!39670 (=> (not res!33750) (not e!26137))))

(assert (=> b!39670 (= res!33750 (isPrefixOf!0 (_2!1998 lt!60171) (_2!1997 lt!59978)))))

(declare-fun d!11654 () Bool)

(assert (=> d!11654 e!26137))

(declare-fun res!33752 () Bool)

(assert (=> d!11654 (=> (not res!33752) (not e!26137))))

(assert (=> d!11654 (= res!33752 (isPrefixOf!0 (_1!1998 lt!60171) (_2!1998 lt!60171)))))

(declare-fun lt!60170 () BitStream!1542)

(assert (=> d!11654 (= lt!60171 (tuple2!3823 lt!60170 (_2!1997 lt!59978)))))

(declare-fun lt!60163 () Unit!2813)

(declare-fun lt!60168 () Unit!2813)

(assert (=> d!11654 (= lt!60163 lt!60168)))

(assert (=> d!11654 (isPrefixOf!0 lt!60170 (_2!1997 lt!59978))))

(assert (=> d!11654 (= lt!60168 (lemmaIsPrefixTransitive!0 lt!60170 (_2!1997 lt!59978) (_2!1997 lt!59978)))))

(declare-fun lt!60159 () Unit!2813)

(declare-fun lt!60169 () Unit!2813)

(assert (=> d!11654 (= lt!60159 lt!60169)))

(assert (=> d!11654 (isPrefixOf!0 lt!60170 (_2!1997 lt!59978))))

(assert (=> d!11654 (= lt!60169 (lemmaIsPrefixTransitive!0 lt!60170 thiss!1379 (_2!1997 lt!59978)))))

(declare-fun lt!60173 () Unit!2813)

(assert (=> d!11654 (= lt!60173 e!26138)))

(declare-fun c!2694 () Bool)

(assert (=> d!11654 (= c!2694 (not (= (size!896 (buf!1224 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!60167 () Unit!2813)

(declare-fun lt!60166 () Unit!2813)

(assert (=> d!11654 (= lt!60167 lt!60166)))

(assert (=> d!11654 (isPrefixOf!0 (_2!1997 lt!59978) (_2!1997 lt!59978))))

(assert (=> d!11654 (= lt!60166 (lemmaIsPrefixRefl!0 (_2!1997 lt!59978)))))

(declare-fun lt!60164 () Unit!2813)

(declare-fun lt!60172 () Unit!2813)

(assert (=> d!11654 (= lt!60164 lt!60172)))

(assert (=> d!11654 (= lt!60172 (lemmaIsPrefixRefl!0 (_2!1997 lt!59978)))))

(declare-fun lt!60154 () Unit!2813)

(declare-fun lt!60160 () Unit!2813)

(assert (=> d!11654 (= lt!60154 lt!60160)))

(assert (=> d!11654 (isPrefixOf!0 lt!60170 lt!60170)))

(assert (=> d!11654 (= lt!60160 (lemmaIsPrefixRefl!0 lt!60170))))

(declare-fun lt!60156 () Unit!2813)

(declare-fun lt!60161 () Unit!2813)

(assert (=> d!11654 (= lt!60156 lt!60161)))

(assert (=> d!11654 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11654 (= lt!60161 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11654 (= lt!60170 (BitStream!1543 (buf!1224 (_2!1997 lt!59978)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(assert (=> d!11654 (isPrefixOf!0 thiss!1379 (_2!1997 lt!59978))))

(assert (=> d!11654 (= (reader!0 thiss!1379 (_2!1997 lt!59978)) lt!60171)))

(declare-fun b!39671 () Bool)

(declare-fun Unit!2817 () Unit!2813)

(assert (=> b!39671 (= e!26138 Unit!2817)))

(declare-fun b!39672 () Bool)

(declare-fun lt!60158 () (_ BitVec 64))

(declare-fun lt!60155 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1542 (_ BitVec 64)) BitStream!1542)

(assert (=> b!39672 (= e!26137 (= (_1!1998 lt!60171) (withMovedBitIndex!0 (_2!1998 lt!60171) (bvsub lt!60158 lt!60155))))))

(assert (=> b!39672 (or (= (bvand lt!60158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60155 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60158 lt!60155) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39672 (= lt!60155 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59978))) (currentByte!2636 (_2!1997 lt!59978)) (currentBit!2631 (_2!1997 lt!59978))))))

(assert (=> b!39672 (= lt!60158 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(assert (= (and d!11654 c!2694) b!39668))

(assert (= (and d!11654 (not c!2694)) b!39671))

(assert (= (and d!11654 res!33752) b!39669))

(assert (= (and b!39669 res!33751) b!39670))

(assert (= (and b!39670 res!33750) b!39672))

(declare-fun m!60493 () Bool)

(assert (=> b!39670 m!60493))

(declare-fun m!60495 () Bool)

(assert (=> d!11654 m!60495))

(declare-fun m!60497 () Bool)

(assert (=> d!11654 m!60497))

(assert (=> d!11654 m!60319))

(declare-fun m!60499 () Bool)

(assert (=> d!11654 m!60499))

(declare-fun m!60501 () Bool)

(assert (=> d!11654 m!60501))

(declare-fun m!60503 () Bool)

(assert (=> d!11654 m!60503))

(declare-fun m!60505 () Bool)

(assert (=> d!11654 m!60505))

(declare-fun m!60507 () Bool)

(assert (=> d!11654 m!60507))

(assert (=> d!11654 m!60285))

(declare-fun m!60509 () Bool)

(assert (=> d!11654 m!60509))

(assert (=> d!11654 m!60287))

(declare-fun m!60511 () Bool)

(assert (=> b!39672 m!60511))

(assert (=> b!39672 m!60291))

(assert (=> b!39672 m!60289))

(assert (=> b!39668 m!60289))

(declare-fun m!60513 () Bool)

(assert (=> b!39668 m!60513))

(declare-fun m!60515 () Bool)

(assert (=> b!39668 m!60515))

(declare-fun m!60517 () Bool)

(assert (=> b!39669 m!60517))

(assert (=> b!39554 d!11654))

(declare-fun d!11656 () Bool)

(assert (=> d!11656 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!59968) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985)))) lt!59968))))

(declare-fun bs!3103 () Bool)

(assert (= bs!3103 d!11656))

(declare-fun m!60519 () Bool)

(assert (=> bs!3103 m!60519))

(assert (=> b!39554 d!11656))

(declare-fun b!39673 () Bool)

(declare-fun e!26140 () Unit!2813)

(declare-fun lt!60182 () Unit!2813)

(assert (=> b!39673 (= e!26140 lt!60182)))

(declare-fun lt!60177 () (_ BitVec 64))

(assert (=> b!39673 (= lt!60177 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60185 () (_ BitVec 64))

(assert (=> b!39673 (= lt!60185 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))))))

(assert (=> b!39673 (= lt!60182 (arrayBitRangesEqSymmetric!0 (buf!1224 (_2!1997 lt!59985)) (buf!1224 (_2!1997 lt!59978)) lt!60177 lt!60185))))

(assert (=> b!39673 (arrayBitRangesEq!0 (buf!1224 (_2!1997 lt!59978)) (buf!1224 (_2!1997 lt!59985)) lt!60177 lt!60185)))

(declare-fun b!39674 () Bool)

(declare-fun res!33754 () Bool)

(declare-fun e!26139 () Bool)

(assert (=> b!39674 (=> (not res!33754) (not e!26139))))

(declare-fun lt!60191 () tuple2!3822)

(assert (=> b!39674 (= res!33754 (isPrefixOf!0 (_1!1998 lt!60191) (_2!1997 lt!59985)))))

(declare-fun b!39675 () Bool)

(declare-fun res!33753 () Bool)

(assert (=> b!39675 (=> (not res!33753) (not e!26139))))

(assert (=> b!39675 (= res!33753 (isPrefixOf!0 (_2!1998 lt!60191) (_2!1997 lt!59978)))))

(declare-fun d!11658 () Bool)

(assert (=> d!11658 e!26139))

(declare-fun res!33755 () Bool)

(assert (=> d!11658 (=> (not res!33755) (not e!26139))))

(assert (=> d!11658 (= res!33755 (isPrefixOf!0 (_1!1998 lt!60191) (_2!1998 lt!60191)))))

(declare-fun lt!60190 () BitStream!1542)

(assert (=> d!11658 (= lt!60191 (tuple2!3823 lt!60190 (_2!1997 lt!59978)))))

(declare-fun lt!60183 () Unit!2813)

(declare-fun lt!60188 () Unit!2813)

(assert (=> d!11658 (= lt!60183 lt!60188)))

(assert (=> d!11658 (isPrefixOf!0 lt!60190 (_2!1997 lt!59978))))

(assert (=> d!11658 (= lt!60188 (lemmaIsPrefixTransitive!0 lt!60190 (_2!1997 lt!59978) (_2!1997 lt!59978)))))

(declare-fun lt!60179 () Unit!2813)

(declare-fun lt!60189 () Unit!2813)

(assert (=> d!11658 (= lt!60179 lt!60189)))

(assert (=> d!11658 (isPrefixOf!0 lt!60190 (_2!1997 lt!59978))))

(assert (=> d!11658 (= lt!60189 (lemmaIsPrefixTransitive!0 lt!60190 (_2!1997 lt!59985) (_2!1997 lt!59978)))))

(declare-fun lt!60193 () Unit!2813)

(assert (=> d!11658 (= lt!60193 e!26140)))

(declare-fun c!2695 () Bool)

(assert (=> d!11658 (= c!2695 (not (= (size!896 (buf!1224 (_2!1997 lt!59985))) #b00000000000000000000000000000000)))))

(declare-fun lt!60187 () Unit!2813)

(declare-fun lt!60186 () Unit!2813)

(assert (=> d!11658 (= lt!60187 lt!60186)))

(assert (=> d!11658 (isPrefixOf!0 (_2!1997 lt!59978) (_2!1997 lt!59978))))

(assert (=> d!11658 (= lt!60186 (lemmaIsPrefixRefl!0 (_2!1997 lt!59978)))))

(declare-fun lt!60184 () Unit!2813)

(declare-fun lt!60192 () Unit!2813)

(assert (=> d!11658 (= lt!60184 lt!60192)))

(assert (=> d!11658 (= lt!60192 (lemmaIsPrefixRefl!0 (_2!1997 lt!59978)))))

(declare-fun lt!60174 () Unit!2813)

(declare-fun lt!60180 () Unit!2813)

(assert (=> d!11658 (= lt!60174 lt!60180)))

(assert (=> d!11658 (isPrefixOf!0 lt!60190 lt!60190)))

(assert (=> d!11658 (= lt!60180 (lemmaIsPrefixRefl!0 lt!60190))))

(declare-fun lt!60176 () Unit!2813)

(declare-fun lt!60181 () Unit!2813)

(assert (=> d!11658 (= lt!60176 lt!60181)))

(assert (=> d!11658 (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!59985))))

(assert (=> d!11658 (= lt!60181 (lemmaIsPrefixRefl!0 (_2!1997 lt!59985)))))

(assert (=> d!11658 (= lt!60190 (BitStream!1543 (buf!1224 (_2!1997 lt!59978)) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))))))

(assert (=> d!11658 (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!59978))))

(assert (=> d!11658 (= (reader!0 (_2!1997 lt!59985) (_2!1997 lt!59978)) lt!60191)))

(declare-fun b!39676 () Bool)

(declare-fun Unit!2819 () Unit!2813)

(assert (=> b!39676 (= e!26140 Unit!2819)))

(declare-fun lt!60178 () (_ BitVec 64))

(declare-fun lt!60175 () (_ BitVec 64))

(declare-fun b!39677 () Bool)

(assert (=> b!39677 (= e!26139 (= (_1!1998 lt!60191) (withMovedBitIndex!0 (_2!1998 lt!60191) (bvsub lt!60178 lt!60175))))))

(assert (=> b!39677 (or (= (bvand lt!60178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60178 lt!60175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39677 (= lt!60175 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59978))) (currentByte!2636 (_2!1997 lt!59978)) (currentBit!2631 (_2!1997 lt!59978))))))

(assert (=> b!39677 (= lt!60178 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))))))

(assert (= (and d!11658 c!2695) b!39673))

(assert (= (and d!11658 (not c!2695)) b!39676))

(assert (= (and d!11658 res!33755) b!39674))

(assert (= (and b!39674 res!33754) b!39675))

(assert (= (and b!39675 res!33753) b!39677))

(declare-fun m!60521 () Bool)

(assert (=> b!39675 m!60521))

(assert (=> d!11658 m!60495))

(declare-fun m!60523 () Bool)

(assert (=> d!11658 m!60523))

(assert (=> d!11658 m!60321))

(declare-fun m!60525 () Bool)

(assert (=> d!11658 m!60525))

(declare-fun m!60527 () Bool)

(assert (=> d!11658 m!60527))

(declare-fun m!60529 () Bool)

(assert (=> d!11658 m!60529))

(declare-fun m!60531 () Bool)

(assert (=> d!11658 m!60531))

(declare-fun m!60533 () Bool)

(assert (=> d!11658 m!60533))

(declare-fun m!60535 () Bool)

(assert (=> d!11658 m!60535))

(assert (=> d!11658 m!60509))

(declare-fun m!60537 () Bool)

(assert (=> d!11658 m!60537))

(declare-fun m!60539 () Bool)

(assert (=> b!39677 m!60539))

(assert (=> b!39677 m!60291))

(assert (=> b!39677 m!60345))

(assert (=> b!39673 m!60345))

(declare-fun m!60541 () Bool)

(assert (=> b!39673 m!60541))

(declare-fun m!60543 () Bool)

(assert (=> b!39673 m!60543))

(declare-fun m!60545 () Bool)

(assert (=> b!39674 m!60545))

(assert (=> b!39554 d!11658))

(declare-fun d!11660 () Bool)

(assert (=> d!11660 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59978)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3104 () Bool)

(assert (= bs!3104 d!11660))

(declare-fun m!60547 () Bool)

(assert (=> bs!3104 m!60547))

(assert (=> b!39554 d!11660))

(declare-fun b!39681 () Bool)

(declare-fun e!26141 () Bool)

(declare-fun lt!60194 () List!472)

(assert (=> b!39681 (= e!26141 (> (length!198 lt!60194) 0))))

(declare-fun d!11662 () Bool)

(assert (=> d!11662 e!26141))

(declare-fun c!2696 () Bool)

(assert (=> d!11662 (= c!2696 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26142 () tuple2!3834)

(assert (=> d!11662 (= lt!60194 (_1!2004 e!26142))))

(declare-fun c!2697 () Bool)

(assert (=> d!11662 (= c!2697 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11662 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11662 (= (bitStreamReadBitsIntoList!0 (_2!1997 lt!59978) (_1!1998 lt!59982) (bvsub to!314 i!635)) lt!60194)))

(declare-fun lt!60196 () tuple2!3832)

(declare-fun b!39679 () Bool)

(declare-fun lt!60195 () (_ BitVec 64))

(assert (=> b!39679 (= e!26142 (tuple2!3835 (Cons!468 (_1!2003 lt!60196) (bitStreamReadBitsIntoList!0 (_2!1997 lt!59978) (_2!2003 lt!60196) (bvsub (bvsub to!314 i!635) lt!60195))) (_2!2003 lt!60196)))))

(assert (=> b!39679 (= lt!60196 (readBit!0 (_1!1998 lt!59982)))))

(assert (=> b!39679 (= lt!60195 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39678 () Bool)

(assert (=> b!39678 (= e!26142 (tuple2!3835 Nil!469 (_1!1998 lt!59982)))))

(declare-fun b!39680 () Bool)

(assert (=> b!39680 (= e!26141 (isEmpty!111 lt!60194))))

(assert (= (and d!11662 c!2697) b!39678))

(assert (= (and d!11662 (not c!2697)) b!39679))

(assert (= (and d!11662 c!2696) b!39680))

(assert (= (and d!11662 (not c!2696)) b!39681))

(declare-fun m!60549 () Bool)

(assert (=> b!39681 m!60549))

(declare-fun m!60551 () Bool)

(assert (=> b!39679 m!60551))

(assert (=> b!39679 m!60465))

(declare-fun m!60553 () Bool)

(assert (=> b!39680 m!60553))

(assert (=> b!39554 d!11662))

(declare-fun d!11664 () Bool)

(assert (=> d!11664 (= (invariant!0 (currentBit!2631 (_2!1997 lt!59978)) (currentByte!2636 (_2!1997 lt!59978)) (size!896 (buf!1224 (_2!1997 lt!59978)))) (and (bvsge (currentBit!2631 (_2!1997 lt!59978)) #b00000000000000000000000000000000) (bvslt (currentBit!2631 (_2!1997 lt!59978)) #b00000000000000000000000000001000) (bvsge (currentByte!2636 (_2!1997 lt!59978)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2636 (_2!1997 lt!59978)) (size!896 (buf!1224 (_2!1997 lt!59978)))) (and (= (currentBit!2631 (_2!1997 lt!59978)) #b00000000000000000000000000000000) (= (currentByte!2636 (_2!1997 lt!59978)) (size!896 (buf!1224 (_2!1997 lt!59978))))))))))

(assert (=> b!39543 d!11664))

(declare-fun d!11666 () Bool)

(assert (=> d!11666 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3105 () Bool)

(assert (= bs!3105 d!11666))

(assert (=> bs!3105 m!60337))

(declare-fun m!60555 () Bool)

(assert (=> bs!3105 m!60555))

(assert (=> b!39545 d!11666))

(declare-fun d!11668 () Bool)

(assert (=> d!11668 (= (head!309 (byteArrayBitContentToList!0 (_2!1997 lt!59978) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!587 (byteArrayBitContentToList!0 (_2!1997 lt!59978) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!39545 d!11668))

(declare-fun d!11670 () Bool)

(declare-fun c!2700 () Bool)

(assert (=> d!11670 (= c!2700 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26145 () List!472)

(assert (=> d!11670 (= (byteArrayBitContentToList!0 (_2!1997 lt!59978) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!26145)))

(declare-fun b!39686 () Bool)

(assert (=> b!39686 (= e!26145 Nil!469)))

(declare-fun b!39687 () Bool)

(assert (=> b!39687 (= e!26145 (Cons!468 (not (= (bvand ((_ sign_extend 24) (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1997 lt!59978) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11670 c!2700) b!39686))

(assert (= (and d!11670 (not c!2700)) b!39687))

(assert (=> b!39687 m!60337))

(assert (=> b!39687 m!60555))

(declare-fun m!60557 () Bool)

(assert (=> b!39687 m!60557))

(assert (=> b!39545 d!11670))

(declare-fun d!11672 () Bool)

(assert (=> d!11672 (= (bitAt!0 (buf!1224 (_2!1997 lt!59978)) lt!59981) (not (= (bvand ((_ sign_extend 24) (select (arr!1392 (buf!1224 (_2!1997 lt!59978))) ((_ extract 31 0) (bvsdiv lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3106 () Bool)

(assert (= bs!3106 d!11672))

(declare-fun m!60559 () Bool)

(assert (=> bs!3106 m!60559))

(assert (=> bs!3106 m!60473))

(assert (=> b!39555 d!11672))

(declare-fun d!11674 () Bool)

(assert (=> d!11674 (= (bitAt!0 (buf!1224 (_2!1997 lt!59985)) lt!59981) (bitAt!0 (buf!1224 (_2!1997 lt!59978)) lt!59981))))

(declare-fun lt!60199 () Unit!2813)

(declare-fun choose!31 (array!1987 array!1987 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2813)

(assert (=> d!11674 (= lt!60199 (choose!31 (buf!1224 (_2!1997 lt!59985)) (buf!1224 (_2!1997 lt!59978)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59981 lt!59970))))

(assert (=> d!11674 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!59970))))

(assert (=> d!11674 (= (arrayBitRangesEqImpliesEq!0 (buf!1224 (_2!1997 lt!59985)) (buf!1224 (_2!1997 lt!59978)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59981 lt!59970) lt!60199)))

(declare-fun bs!3107 () Bool)

(assert (= bs!3107 d!11674))

(assert (=> bs!3107 m!60347))

(assert (=> bs!3107 m!60265))

(declare-fun m!60561 () Bool)

(assert (=> bs!3107 m!60561))

(assert (=> b!39555 d!11674))

(declare-fun d!11676 () Bool)

(assert (=> d!11676 (= (bitAt!0 (buf!1224 (_1!1998 lt!59969)) lt!59981) (not (= (bvand ((_ sign_extend 24) (select (arr!1392 (buf!1224 (_1!1998 lt!59969))) ((_ extract 31 0) (bvsdiv lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3108 () Bool)

(assert (= bs!3108 d!11676))

(declare-fun m!60563 () Bool)

(assert (=> bs!3108 m!60563))

(assert (=> bs!3108 m!60473))

(assert (=> b!39544 d!11676))

(declare-fun d!11678 () Bool)

(assert (=> d!11678 (= (bitAt!0 (buf!1224 (_1!1998 lt!59982)) lt!59981) (not (= (bvand ((_ sign_extend 24) (select (arr!1392 (buf!1224 (_1!1998 lt!59982))) ((_ extract 31 0) (bvsdiv lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!59981 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3109 () Bool)

(assert (= bs!3109 d!11678))

(declare-fun m!60565 () Bool)

(assert (=> bs!3109 m!60565))

(assert (=> bs!3109 m!60473))

(assert (=> b!39544 d!11678))

(declare-fun d!11680 () Bool)

(assert (=> d!11680 (= (invariant!0 (currentBit!2631 (_2!1997 lt!59985)) (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59985)))) (and (bvsge (currentBit!2631 (_2!1997 lt!59985)) #b00000000000000000000000000000000) (bvslt (currentBit!2631 (_2!1997 lt!59985)) #b00000000000000000000000000001000) (bvsge (currentByte!2636 (_2!1997 lt!59985)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59985)))) (and (= (currentBit!2631 (_2!1997 lt!59985)) #b00000000000000000000000000000000) (= (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59985))))))))))

(assert (=> b!39546 d!11680))

(declare-fun d!11682 () Bool)

(assert (=> d!11682 (= (head!309 lt!59973) (h!587 lt!59973))))

(assert (=> b!39556 d!11682))

(declare-fun d!11684 () Bool)

(declare-fun res!33756 () Bool)

(declare-fun e!26147 () Bool)

(assert (=> d!11684 (=> (not res!33756) (not e!26147))))

(assert (=> d!11684 (= res!33756 (= (size!896 (buf!1224 thiss!1379)) (size!896 (buf!1224 (_2!1997 lt!59985)))))))

(assert (=> d!11684 (= (isPrefixOf!0 thiss!1379 (_2!1997 lt!59985)) e!26147)))

(declare-fun b!39688 () Bool)

(declare-fun res!33758 () Bool)

(assert (=> b!39688 (=> (not res!33758) (not e!26147))))

(assert (=> b!39688 (= res!33758 (bvsle (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)) (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985)))))))

(declare-fun b!39689 () Bool)

(declare-fun e!26146 () Bool)

(assert (=> b!39689 (= e!26147 e!26146)))

(declare-fun res!33757 () Bool)

(assert (=> b!39689 (=> res!33757 e!26146)))

(assert (=> b!39689 (= res!33757 (= (size!896 (buf!1224 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39690 () Bool)

(assert (=> b!39690 (= e!26146 (arrayBitRangesEq!0 (buf!1224 thiss!1379) (buf!1224 (_2!1997 lt!59985)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379))))))

(assert (= (and d!11684 res!33756) b!39688))

(assert (= (and b!39688 res!33758) b!39689))

(assert (= (and b!39689 (not res!33757)) b!39690))

(assert (=> b!39688 m!60289))

(assert (=> b!39688 m!60345))

(assert (=> b!39690 m!60289))

(assert (=> b!39690 m!60289))

(declare-fun m!60567 () Bool)

(assert (=> b!39690 m!60567))

(assert (=> b!39537 d!11684))

(declare-fun d!11686 () Bool)

(assert (=> d!11686 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!59968) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985)))) lt!59968))))

(declare-fun bs!3110 () Bool)

(assert (= bs!3110 d!11686))

(declare-fun m!60569 () Bool)

(assert (=> bs!3110 m!60569))

(assert (=> b!39537 d!11686))

(declare-fun d!11688 () Bool)

(declare-fun e!26150 () Bool)

(assert (=> d!11688 e!26150))

(declare-fun res!33761 () Bool)

(assert (=> d!11688 (=> (not res!33761) (not e!26150))))

(assert (=> d!11688 (= res!33761 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!60202 () Unit!2813)

(declare-fun choose!27 (BitStream!1542 BitStream!1542 (_ BitVec 64) (_ BitVec 64)) Unit!2813)

(assert (=> d!11688 (= lt!60202 (choose!27 thiss!1379 (_2!1997 lt!59985) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11688 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1997 lt!59985) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!60202)))

(declare-fun b!39693 () Bool)

(assert (=> b!39693 (= e!26150 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11688 res!33761) b!39693))

(declare-fun m!60571 () Bool)

(assert (=> d!11688 m!60571))

(declare-fun m!60573 () Bool)

(assert (=> b!39693 m!60573))

(assert (=> b!39537 d!11688))

(declare-fun b!39751 () Bool)

(declare-fun e!26185 () Bool)

(declare-fun lt!60264 () tuple2!3824)

(declare-fun lt!60272 () tuple2!3820)

(assert (=> b!39751 (= e!26185 (= (bitIndex!0 (size!896 (buf!1224 (_1!1999 lt!60264))) (currentByte!2636 (_1!1999 lt!60264)) (currentBit!2631 (_1!1999 lt!60264))) (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60272))) (currentByte!2636 (_2!1997 lt!60272)) (currentBit!2631 (_2!1997 lt!60272)))))))

(declare-fun b!39752 () Bool)

(declare-fun res!33797 () Bool)

(declare-fun e!26182 () Bool)

(assert (=> b!39752 (=> (not res!33797) (not e!26182))))

(declare-fun lt!60269 () (_ BitVec 64))

(declare-fun lt!60268 () tuple2!3820)

(declare-fun lt!60274 () (_ BitVec 64))

(assert (=> b!39752 (= res!33797 (= (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60268))) (currentByte!2636 (_2!1997 lt!60268)) (currentBit!2631 (_2!1997 lt!60268))) (bvadd lt!60269 lt!60274)))))

(assert (=> b!39752 (or (not (= (bvand lt!60269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60274 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!60269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!60269 lt!60274) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39752 (= lt!60274 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!39752 (= lt!60269 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(declare-fun b!39753 () Bool)

(declare-fun res!33798 () Bool)

(declare-fun e!26183 () Bool)

(assert (=> b!39753 (=> (not res!33798) (not e!26183))))

(assert (=> b!39753 (= res!33798 (= (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60272))) (currentByte!2636 (_2!1997 lt!60272)) (currentBit!2631 (_2!1997 lt!60272))) (bvadd (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!39754 () Bool)

(declare-fun e!26184 () Bool)

(declare-fun lt!60270 () tuple2!3824)

(assert (=> b!39754 (= e!26184 (= (bitIndex!0 (size!896 (buf!1224 (_1!1999 lt!60270))) (currentByte!2636 (_1!1999 lt!60270)) (currentBit!2631 (_1!1999 lt!60270))) (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60268))) (currentByte!2636 (_2!1997 lt!60268)) (currentBit!2631 (_2!1997 lt!60268)))))))

(declare-fun b!39755 () Bool)

(declare-fun res!33801 () Bool)

(assert (=> b!39755 (=> (not res!33801) (not e!26183))))

(assert (=> b!39755 (= res!33801 (isPrefixOf!0 thiss!1379 (_2!1997 lt!60272)))))

(declare-fun b!39756 () Bool)

(assert (=> b!39756 (= e!26183 e!26185)))

(declare-fun res!33799 () Bool)

(assert (=> b!39756 (=> (not res!33799) (not e!26185))))

(declare-fun lt!60266 () Bool)

(assert (=> b!39756 (= res!33799 (and (= (_2!1999 lt!60264) lt!60266) (= (_1!1999 lt!60264) (_2!1997 lt!60272))))))

(declare-fun readerFrom!0 (BitStream!1542 (_ BitVec 32) (_ BitVec 32)) BitStream!1542)

(assert (=> b!39756 (= lt!60264 (readBitPure!0 (readerFrom!0 (_2!1997 lt!60272) (currentBit!2631 thiss!1379) (currentByte!2636 thiss!1379))))))

(declare-fun d!11690 () Bool)

(assert (=> d!11690 e!26182))

(declare-fun res!33803 () Bool)

(assert (=> d!11690 (=> (not res!33803) (not e!26182))))

(assert (=> d!11690 (= res!33803 (= (size!896 (buf!1224 (_2!1997 lt!60268))) (size!896 (buf!1224 thiss!1379))))))

(declare-fun lt!60263 () (_ BitVec 8))

(declare-fun lt!60271 () array!1987)

(assert (=> d!11690 (= lt!60263 (select (arr!1392 lt!60271) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11690 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!896 lt!60271)))))

(assert (=> d!11690 (= lt!60271 (array!1988 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!60267 () tuple2!3820)

(assert (=> d!11690 (= lt!60268 (tuple2!3821 (_1!1997 lt!60267) (_2!1997 lt!60267)))))

(assert (=> d!11690 (= lt!60267 lt!60272)))

(assert (=> d!11690 e!26183))

(declare-fun res!33800 () Bool)

(assert (=> d!11690 (=> (not res!33800) (not e!26183))))

(assert (=> d!11690 (= res!33800 (= (size!896 (buf!1224 thiss!1379)) (size!896 (buf!1224 (_2!1997 lt!60272)))))))

(declare-fun appendBit!0 (BitStream!1542 Bool) tuple2!3820)

(assert (=> d!11690 (= lt!60272 (appendBit!0 thiss!1379 lt!60266))))

(assert (=> d!11690 (= lt!60266 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11690 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11690 (= (appendBitFromByte!0 thiss!1379 (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!60268)))

(declare-fun b!39757 () Bool)

(declare-fun res!33802 () Bool)

(assert (=> b!39757 (=> (not res!33802) (not e!26182))))

(assert (=> b!39757 (= res!33802 (isPrefixOf!0 thiss!1379 (_2!1997 lt!60268)))))

(declare-fun b!39758 () Bool)

(assert (=> b!39758 (= e!26182 e!26184)))

(declare-fun res!33796 () Bool)

(assert (=> b!39758 (=> (not res!33796) (not e!26184))))

(assert (=> b!39758 (= res!33796 (and (= (_2!1999 lt!60270) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!60263)) #b00000000000000000000000000000000))) (= (_1!1999 lt!60270) (_2!1997 lt!60268))))))

(declare-datatypes ((tuple2!3844 0))(
  ( (tuple2!3845 (_1!2009 array!1987) (_2!2009 BitStream!1542)) )
))
(declare-fun lt!60273 () tuple2!3844)

(declare-fun lt!60265 () BitStream!1542)

(declare-fun readBits!0 (BitStream!1542 (_ BitVec 64)) tuple2!3844)

(assert (=> b!39758 (= lt!60273 (readBits!0 lt!60265 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39758 (= lt!60270 (readBitPure!0 lt!60265))))

(assert (=> b!39758 (= lt!60265 (readerFrom!0 (_2!1997 lt!60268) (currentBit!2631 thiss!1379) (currentByte!2636 thiss!1379)))))

(assert (= (and d!11690 res!33800) b!39753))

(assert (= (and b!39753 res!33798) b!39755))

(assert (= (and b!39755 res!33801) b!39756))

(assert (= (and b!39756 res!33799) b!39751))

(assert (= (and d!11690 res!33803) b!39752))

(assert (= (and b!39752 res!33797) b!39757))

(assert (= (and b!39757 res!33802) b!39758))

(assert (= (and b!39758 res!33796) b!39754))

(declare-fun m!60607 () Bool)

(assert (=> b!39756 m!60607))

(assert (=> b!39756 m!60607))

(declare-fun m!60609 () Bool)

(assert (=> b!39756 m!60609))

(declare-fun m!60611 () Bool)

(assert (=> b!39757 m!60611))

(declare-fun m!60613 () Bool)

(assert (=> b!39752 m!60613))

(assert (=> b!39752 m!60289))

(declare-fun m!60615 () Bool)

(assert (=> b!39753 m!60615))

(assert (=> b!39753 m!60289))

(declare-fun m!60617 () Bool)

(assert (=> b!39758 m!60617))

(declare-fun m!60619 () Bool)

(assert (=> b!39758 m!60619))

(declare-fun m!60621 () Bool)

(assert (=> b!39758 m!60621))

(declare-fun m!60623 () Bool)

(assert (=> b!39751 m!60623))

(assert (=> b!39751 m!60615))

(declare-fun m!60625 () Bool)

(assert (=> b!39755 m!60625))

(declare-fun m!60627 () Bool)

(assert (=> b!39754 m!60627))

(assert (=> b!39754 m!60613))

(declare-fun m!60629 () Bool)

(assert (=> d!11690 m!60629))

(declare-fun m!60631 () Bool)

(assert (=> d!11690 m!60631))

(assert (=> d!11690 m!60555))

(assert (=> b!39537 d!11690))

(declare-fun d!11722 () Bool)

(assert (=> d!11722 (= (head!309 (byteArrayBitContentToList!0 (_2!1997 lt!59985) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!587 (byteArrayBitContentToList!0 (_2!1997 lt!59985) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!39558 d!11722))

(declare-fun d!11724 () Bool)

(declare-fun c!2712 () Bool)

(assert (=> d!11724 (= c!2712 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26186 () List!472)

(assert (=> d!11724 (= (byteArrayBitContentToList!0 (_2!1997 lt!59985) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!26186)))

(declare-fun b!39759 () Bool)

(assert (=> b!39759 (= e!26186 Nil!469)))

(declare-fun b!39760 () Bool)

(assert (=> b!39760 (= e!26186 (Cons!468 (not (= (bvand ((_ sign_extend 24) (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1997 lt!59985) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11724 c!2712) b!39759))

(assert (= (and d!11724 (not c!2712)) b!39760))

(assert (=> b!39760 m!60337))

(assert (=> b!39760 m!60555))

(declare-fun m!60633 () Bool)

(assert (=> b!39760 m!60633))

(assert (=> b!39558 d!11724))

(declare-fun d!11726 () Bool)

(assert (=> d!11726 (= (head!309 (bitStreamReadBitsIntoList!0 (_2!1997 lt!59985) (_1!1998 lt!59989) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!587 (bitStreamReadBitsIntoList!0 (_2!1997 lt!59985) (_1!1998 lt!59989) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!39558 d!11726))

(declare-fun b!39764 () Bool)

(declare-fun e!26187 () Bool)

(declare-fun lt!60275 () List!472)

(assert (=> b!39764 (= e!26187 (> (length!198 lt!60275) 0))))

(declare-fun d!11728 () Bool)

(assert (=> d!11728 e!26187))

(declare-fun c!2713 () Bool)

(assert (=> d!11728 (= c!2713 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26188 () tuple2!3834)

(assert (=> d!11728 (= lt!60275 (_1!2004 e!26188))))

(declare-fun c!2714 () Bool)

(assert (=> d!11728 (= c!2714 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11728 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11728 (= (bitStreamReadBitsIntoList!0 (_2!1997 lt!59985) (_1!1998 lt!59989) #b0000000000000000000000000000000000000000000000000000000000000001) lt!60275)))

(declare-fun lt!60277 () tuple2!3832)

(declare-fun lt!60276 () (_ BitVec 64))

(declare-fun b!39762 () Bool)

(assert (=> b!39762 (= e!26188 (tuple2!3835 (Cons!468 (_1!2003 lt!60277) (bitStreamReadBitsIntoList!0 (_2!1997 lt!59985) (_2!2003 lt!60277) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!60276))) (_2!2003 lt!60277)))))

(assert (=> b!39762 (= lt!60277 (readBit!0 (_1!1998 lt!59989)))))

(assert (=> b!39762 (= lt!60276 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39761 () Bool)

(assert (=> b!39761 (= e!26188 (tuple2!3835 Nil!469 (_1!1998 lt!59989)))))

(declare-fun b!39763 () Bool)

(assert (=> b!39763 (= e!26187 (isEmpty!111 lt!60275))))

(assert (= (and d!11728 c!2714) b!39761))

(assert (= (and d!11728 (not c!2714)) b!39762))

(assert (= (and d!11728 c!2713) b!39763))

(assert (= (and d!11728 (not c!2713)) b!39764))

(declare-fun m!60635 () Bool)

(assert (=> b!39764 m!60635))

(declare-fun m!60637 () Bool)

(assert (=> b!39762 m!60637))

(declare-fun m!60639 () Bool)

(assert (=> b!39762 m!60639))

(declare-fun m!60641 () Bool)

(assert (=> b!39763 m!60641))

(assert (=> b!39558 d!11728))

(declare-fun d!11730 () Bool)

(declare-fun e!26189 () Bool)

(assert (=> d!11730 e!26189))

(declare-fun res!33805 () Bool)

(assert (=> d!11730 (=> (not res!33805) (not e!26189))))

(declare-fun lt!60282 () (_ BitVec 64))

(declare-fun lt!60283 () (_ BitVec 64))

(declare-fun lt!60278 () (_ BitVec 64))

(assert (=> d!11730 (= res!33805 (= lt!60283 (bvsub lt!60282 lt!60278)))))

(assert (=> d!11730 (or (= (bvand lt!60282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60282 lt!60278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11730 (= lt!60278 (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985)))))))

(declare-fun lt!60281 () (_ BitVec 64))

(declare-fun lt!60279 () (_ BitVec 64))

(assert (=> d!11730 (= lt!60282 (bvmul lt!60281 lt!60279))))

(assert (=> d!11730 (or (= lt!60281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!60279 (bvsdiv (bvmul lt!60281 lt!60279) lt!60281)))))

(assert (=> d!11730 (= lt!60279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11730 (= lt!60281 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))))))

(assert (=> d!11730 (= lt!60283 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985)))))))

(assert (=> d!11730 (invariant!0 (currentBit!2631 (_2!1997 lt!59985)) (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59985))))))

(assert (=> d!11730 (= (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))) lt!60283)))

(declare-fun b!39765 () Bool)

(declare-fun res!33804 () Bool)

(assert (=> b!39765 (=> (not res!33804) (not e!26189))))

(assert (=> b!39765 (= res!33804 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!60283))))

(declare-fun b!39766 () Bool)

(declare-fun lt!60280 () (_ BitVec 64))

(assert (=> b!39766 (= e!26189 (bvsle lt!60283 (bvmul lt!60280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!39766 (or (= lt!60280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!60280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!60280)))))

(assert (=> b!39766 (= lt!60280 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))))))

(assert (= (and d!11730 res!33805) b!39765))

(assert (= (and b!39765 res!33804) b!39766))

(assert (=> d!11730 m!60569))

(assert (=> d!11730 m!60297))

(assert (=> b!39547 d!11730))

(declare-fun d!11732 () Bool)

(declare-fun res!33806 () Bool)

(declare-fun e!26191 () Bool)

(assert (=> d!11732 (=> (not res!33806) (not e!26191))))

(assert (=> d!11732 (= res!33806 (= (size!896 (buf!1224 (_2!1997 lt!59985))) (size!896 (buf!1224 (_2!1997 lt!59978)))))))

(assert (=> d!11732 (= (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!59978)) e!26191)))

(declare-fun b!39767 () Bool)

(declare-fun res!33808 () Bool)

(assert (=> b!39767 (=> (not res!33808) (not e!26191))))

(assert (=> b!39767 (= res!33808 (bvsle (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))) (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59978))) (currentByte!2636 (_2!1997 lt!59978)) (currentBit!2631 (_2!1997 lt!59978)))))))

(declare-fun b!39768 () Bool)

(declare-fun e!26190 () Bool)

(assert (=> b!39768 (= e!26191 e!26190)))

(declare-fun res!33807 () Bool)

(assert (=> b!39768 (=> res!33807 e!26190)))

(assert (=> b!39768 (= res!33807 (= (size!896 (buf!1224 (_2!1997 lt!59985))) #b00000000000000000000000000000000))))

(declare-fun b!39769 () Bool)

(assert (=> b!39769 (= e!26190 (arrayBitRangesEq!0 (buf!1224 (_2!1997 lt!59985)) (buf!1224 (_2!1997 lt!59978)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985)))))))

(assert (= (and d!11732 res!33806) b!39767))

(assert (= (and b!39767 res!33808) b!39768))

(assert (= (and b!39768 (not res!33807)) b!39769))

(assert (=> b!39767 m!60345))

(assert (=> b!39767 m!60291))

(assert (=> b!39769 m!60345))

(assert (=> b!39769 m!60345))

(declare-fun m!60643 () Bool)

(assert (=> b!39769 m!60643))

(assert (=> b!39549 d!11732))

(declare-fun b!39770 () Bool)

(declare-fun e!26193 () Unit!2813)

(declare-fun lt!60292 () Unit!2813)

(assert (=> b!39770 (= e!26193 lt!60292)))

(declare-fun lt!60287 () (_ BitVec 64))

(assert (=> b!39770 (= lt!60287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60295 () (_ BitVec 64))

(assert (=> b!39770 (= lt!60295 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(assert (=> b!39770 (= lt!60292 (arrayBitRangesEqSymmetric!0 (buf!1224 thiss!1379) (buf!1224 (_2!1997 lt!59985)) lt!60287 lt!60295))))

(assert (=> b!39770 (arrayBitRangesEq!0 (buf!1224 (_2!1997 lt!59985)) (buf!1224 thiss!1379) lt!60287 lt!60295)))

(declare-fun b!39771 () Bool)

(declare-fun res!33810 () Bool)

(declare-fun e!26192 () Bool)

(assert (=> b!39771 (=> (not res!33810) (not e!26192))))

(declare-fun lt!60301 () tuple2!3822)

(assert (=> b!39771 (= res!33810 (isPrefixOf!0 (_1!1998 lt!60301) thiss!1379))))

(declare-fun b!39772 () Bool)

(declare-fun res!33809 () Bool)

(assert (=> b!39772 (=> (not res!33809) (not e!26192))))

(assert (=> b!39772 (= res!33809 (isPrefixOf!0 (_2!1998 lt!60301) (_2!1997 lt!59985)))))

(declare-fun d!11734 () Bool)

(assert (=> d!11734 e!26192))

(declare-fun res!33811 () Bool)

(assert (=> d!11734 (=> (not res!33811) (not e!26192))))

(assert (=> d!11734 (= res!33811 (isPrefixOf!0 (_1!1998 lt!60301) (_2!1998 lt!60301)))))

(declare-fun lt!60300 () BitStream!1542)

(assert (=> d!11734 (= lt!60301 (tuple2!3823 lt!60300 (_2!1997 lt!59985)))))

(declare-fun lt!60293 () Unit!2813)

(declare-fun lt!60298 () Unit!2813)

(assert (=> d!11734 (= lt!60293 lt!60298)))

(assert (=> d!11734 (isPrefixOf!0 lt!60300 (_2!1997 lt!59985))))

(assert (=> d!11734 (= lt!60298 (lemmaIsPrefixTransitive!0 lt!60300 (_2!1997 lt!59985) (_2!1997 lt!59985)))))

(declare-fun lt!60289 () Unit!2813)

(declare-fun lt!60299 () Unit!2813)

(assert (=> d!11734 (= lt!60289 lt!60299)))

(assert (=> d!11734 (isPrefixOf!0 lt!60300 (_2!1997 lt!59985))))

(assert (=> d!11734 (= lt!60299 (lemmaIsPrefixTransitive!0 lt!60300 thiss!1379 (_2!1997 lt!59985)))))

(declare-fun lt!60303 () Unit!2813)

(assert (=> d!11734 (= lt!60303 e!26193)))

(declare-fun c!2715 () Bool)

(assert (=> d!11734 (= c!2715 (not (= (size!896 (buf!1224 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!60297 () Unit!2813)

(declare-fun lt!60296 () Unit!2813)

(assert (=> d!11734 (= lt!60297 lt!60296)))

(assert (=> d!11734 (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!59985))))

(assert (=> d!11734 (= lt!60296 (lemmaIsPrefixRefl!0 (_2!1997 lt!59985)))))

(declare-fun lt!60294 () Unit!2813)

(declare-fun lt!60302 () Unit!2813)

(assert (=> d!11734 (= lt!60294 lt!60302)))

(assert (=> d!11734 (= lt!60302 (lemmaIsPrefixRefl!0 (_2!1997 lt!59985)))))

(declare-fun lt!60284 () Unit!2813)

(declare-fun lt!60290 () Unit!2813)

(assert (=> d!11734 (= lt!60284 lt!60290)))

(assert (=> d!11734 (isPrefixOf!0 lt!60300 lt!60300)))

(assert (=> d!11734 (= lt!60290 (lemmaIsPrefixRefl!0 lt!60300))))

(declare-fun lt!60286 () Unit!2813)

(declare-fun lt!60291 () Unit!2813)

(assert (=> d!11734 (= lt!60286 lt!60291)))

(assert (=> d!11734 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11734 (= lt!60291 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11734 (= lt!60300 (BitStream!1543 (buf!1224 (_2!1997 lt!59985)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(assert (=> d!11734 (isPrefixOf!0 thiss!1379 (_2!1997 lt!59985))))

(assert (=> d!11734 (= (reader!0 thiss!1379 (_2!1997 lt!59985)) lt!60301)))

(declare-fun b!39773 () Bool)

(declare-fun Unit!2831 () Unit!2813)

(assert (=> b!39773 (= e!26193 Unit!2831)))

(declare-fun lt!60288 () (_ BitVec 64))

(declare-fun lt!60285 () (_ BitVec 64))

(declare-fun b!39774 () Bool)

(assert (=> b!39774 (= e!26192 (= (_1!1998 lt!60301) (withMovedBitIndex!0 (_2!1998 lt!60301) (bvsub lt!60288 lt!60285))))))

(assert (=> b!39774 (or (= (bvand lt!60288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60285 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60288 lt!60285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39774 (= lt!60285 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))))))

(assert (=> b!39774 (= lt!60288 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)))))

(assert (= (and d!11734 c!2715) b!39770))

(assert (= (and d!11734 (not c!2715)) b!39773))

(assert (= (and d!11734 res!33811) b!39771))

(assert (= (and b!39771 res!33810) b!39772))

(assert (= (and b!39772 res!33809) b!39774))

(declare-fun m!60645 () Bool)

(assert (=> b!39772 m!60645))

(assert (=> d!11734 m!60537))

(declare-fun m!60647 () Bool)

(assert (=> d!11734 m!60647))

(assert (=> d!11734 m!60339))

(declare-fun m!60649 () Bool)

(assert (=> d!11734 m!60649))

(declare-fun m!60651 () Bool)

(assert (=> d!11734 m!60651))

(declare-fun m!60653 () Bool)

(assert (=> d!11734 m!60653))

(declare-fun m!60655 () Bool)

(assert (=> d!11734 m!60655))

(declare-fun m!60657 () Bool)

(assert (=> d!11734 m!60657))

(assert (=> d!11734 m!60285))

(assert (=> d!11734 m!60535))

(assert (=> d!11734 m!60287))

(declare-fun m!60659 () Bool)

(assert (=> b!39774 m!60659))

(assert (=> b!39774 m!60345))

(assert (=> b!39774 m!60289))

(assert (=> b!39770 m!60289))

(declare-fun m!60661 () Bool)

(assert (=> b!39770 m!60661))

(declare-fun m!60663 () Bool)

(assert (=> b!39770 m!60663))

(declare-fun m!60665 () Bool)

(assert (=> b!39771 m!60665))

(assert (=> b!39549 d!11734))

(declare-fun d!11736 () Bool)

(assert (=> d!11736 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60304 () Unit!2813)

(assert (=> d!11736 (= lt!60304 (choose!9 thiss!1379 (buf!1224 (_2!1997 lt!59985)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1543 (buf!1224 (_2!1997 lt!59985)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379))))))

(assert (=> d!11736 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1224 (_2!1997 lt!59985)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!60304)))

(declare-fun bs!3115 () Bool)

(assert (= bs!3115 d!11736))

(assert (=> bs!3115 m!60323))

(declare-fun m!60667 () Bool)

(assert (=> bs!3115 m!60667))

(assert (=> b!39549 d!11736))

(declare-fun d!11738 () Bool)

(assert (=> d!11738 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 thiss!1379)) ((_ sign_extend 32) (currentBit!2631 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3116 () Bool)

(assert (= bs!3116 d!11738))

(declare-fun m!60669 () Bool)

(assert (=> bs!3116 m!60669))

(assert (=> b!39549 d!11738))

(declare-fun b!39943 () Bool)

(declare-fun res!33946 () Bool)

(declare-fun e!26273 () Bool)

(assert (=> b!39943 (=> (not res!33946) (not e!26273))))

(declare-fun lt!60907 () tuple2!3820)

(assert (=> b!39943 (= res!33946 (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!60907)))))

(declare-fun b!39944 () Bool)

(declare-fun res!33941 () Bool)

(assert (=> b!39944 (=> (not res!33941) (not e!26273))))

(assert (=> b!39944 (= res!33941 (invariant!0 (currentBit!2631 (_2!1997 lt!60907)) (currentByte!2636 (_2!1997 lt!60907)) (size!896 (buf!1224 (_2!1997 lt!60907)))))))

(declare-fun b!39946 () Bool)

(declare-fun res!33945 () Bool)

(assert (=> b!39946 (=> (not res!33945) (not e!26273))))

(assert (=> b!39946 (= res!33945 (= (size!896 (buf!1224 (_2!1997 lt!60907))) (size!896 (buf!1224 (_2!1997 lt!59985)))))))

(declare-fun lt!60910 () tuple2!3822)

(declare-fun b!39947 () Bool)

(assert (=> b!39947 (= e!26273 (= (bitStreamReadBitsIntoList!0 (_2!1997 lt!60907) (_1!1998 lt!60910) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1997 lt!60907) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!39947 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39947 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!60919 () Unit!2813)

(declare-fun lt!60906 () Unit!2813)

(assert (=> b!39947 (= lt!60919 lt!60906)))

(declare-fun lt!60897 () (_ BitVec 64))

(assert (=> b!39947 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!60907)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!60897)))

(assert (=> b!39947 (= lt!60906 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1997 lt!59985) (buf!1224 (_2!1997 lt!60907)) lt!60897))))

(declare-fun e!26271 () Bool)

(assert (=> b!39947 e!26271))

(declare-fun res!33943 () Bool)

(assert (=> b!39947 (=> (not res!33943) (not e!26271))))

(assert (=> b!39947 (= res!33943 (and (= (size!896 (buf!1224 (_2!1997 lt!59985))) (size!896 (buf!1224 (_2!1997 lt!60907)))) (bvsge lt!60897 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39947 (= lt!60897 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!39947 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39947 (= lt!60910 (reader!0 (_2!1997 lt!59985) (_2!1997 lt!60907)))))

(declare-fun b!39948 () Bool)

(declare-fun e!26272 () tuple2!3820)

(declare-fun lt!60931 () tuple2!3820)

(declare-fun Unit!2835 () Unit!2813)

(assert (=> b!39948 (= e!26272 (tuple2!3821 Unit!2835 (_2!1997 lt!60931)))))

(declare-fun lt!60918 () tuple2!3820)

(assert (=> b!39948 (= lt!60918 (appendBitFromByte!0 (_2!1997 lt!59985) (select (arr!1392 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!60928 () (_ BitVec 64))

(assert (=> b!39948 (= lt!60928 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60895 () (_ BitVec 64))

(assert (=> b!39948 (= lt!60895 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60933 () Unit!2813)

(assert (=> b!39948 (= lt!60933 (validateOffsetBitsIneqLemma!0 (_2!1997 lt!59985) (_2!1997 lt!60918) lt!60928 lt!60895))))

(assert (=> b!39948 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!60918)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!60918))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!60918))) (bvsub lt!60928 lt!60895))))

(declare-fun lt!60923 () Unit!2813)

(assert (=> b!39948 (= lt!60923 lt!60933)))

(declare-fun lt!60926 () tuple2!3822)

(assert (=> b!39948 (= lt!60926 (reader!0 (_2!1997 lt!59985) (_2!1997 lt!60918)))))

(declare-fun lt!60903 () (_ BitVec 64))

(assert (=> b!39948 (= lt!60903 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60917 () Unit!2813)

(assert (=> b!39948 (= lt!60917 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1997 lt!59985) (buf!1224 (_2!1997 lt!60918)) lt!60903))))

(assert (=> b!39948 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!60918)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!60903)))

(declare-fun lt!60937 () Unit!2813)

(assert (=> b!39948 (= lt!60937 lt!60917)))

(assert (=> b!39948 (= (head!309 (byteArrayBitContentToList!0 (_2!1997 lt!60918) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!309 (bitStreamReadBitsIntoList!0 (_2!1997 lt!60918) (_1!1998 lt!60926) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60927 () Unit!2813)

(declare-fun Unit!2837 () Unit!2813)

(assert (=> b!39948 (= lt!60927 Unit!2837)))

(assert (=> b!39948 (= lt!60931 (appendBitsMSBFirstLoop!0 (_2!1997 lt!60918) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!60894 () Unit!2813)

(assert (=> b!39948 (= lt!60894 (lemmaIsPrefixTransitive!0 (_2!1997 lt!59985) (_2!1997 lt!60918) (_2!1997 lt!60931)))))

(assert (=> b!39948 (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!60931))))

(declare-fun lt!60905 () Unit!2813)

(assert (=> b!39948 (= lt!60905 lt!60894)))

(assert (=> b!39948 (= (size!896 (buf!1224 (_2!1997 lt!60931))) (size!896 (buf!1224 (_2!1997 lt!59985))))))

(declare-fun lt!60896 () Unit!2813)

(declare-fun Unit!2839 () Unit!2813)

(assert (=> b!39948 (= lt!60896 Unit!2839)))

(assert (=> b!39948 (= (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60931))) (currentByte!2636 (_2!1997 lt!60931)) (currentBit!2631 (_2!1997 lt!60931))) (bvsub (bvadd (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60898 () Unit!2813)

(declare-fun Unit!2841 () Unit!2813)

(assert (=> b!39948 (= lt!60898 Unit!2841)))

(assert (=> b!39948 (= (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60931))) (currentByte!2636 (_2!1997 lt!60931)) (currentBit!2631 (_2!1997 lt!60931))) (bvsub (bvsub (bvadd (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60918))) (currentByte!2636 (_2!1997 lt!60918)) (currentBit!2631 (_2!1997 lt!60918))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60904 () Unit!2813)

(declare-fun Unit!2842 () Unit!2813)

(assert (=> b!39948 (= lt!60904 Unit!2842)))

(declare-fun lt!60925 () tuple2!3822)

(declare-fun call!490 () tuple2!3822)

(assert (=> b!39948 (= lt!60925 call!490)))

(declare-fun lt!60915 () (_ BitVec 64))

(assert (=> b!39948 (= lt!60915 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60901 () Unit!2813)

(assert (=> b!39948 (= lt!60901 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1997 lt!59985) (buf!1224 (_2!1997 lt!60931)) lt!60915))))

(assert (=> b!39948 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!60931)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!60915)))

(declare-fun lt!60911 () Unit!2813)

(assert (=> b!39948 (= lt!60911 lt!60901)))

(declare-fun lt!60929 () tuple2!3822)

(assert (=> b!39948 (= lt!60929 (reader!0 (_2!1997 lt!60918) (_2!1997 lt!60931)))))

(declare-fun lt!60899 () (_ BitVec 64))

(assert (=> b!39948 (= lt!60899 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60924 () Unit!2813)

(assert (=> b!39948 (= lt!60924 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1997 lt!60918) (buf!1224 (_2!1997 lt!60931)) lt!60899))))

(assert (=> b!39948 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!60931)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!60918))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!60918))) lt!60899)))

(declare-fun lt!60902 () Unit!2813)

(assert (=> b!39948 (= lt!60902 lt!60924)))

(declare-fun lt!60935 () List!472)

(assert (=> b!39948 (= lt!60935 (byteArrayBitContentToList!0 (_2!1997 lt!60931) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!60909 () List!472)

(assert (=> b!39948 (= lt!60909 (byteArrayBitContentToList!0 (_2!1997 lt!60931) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60936 () List!472)

(assert (=> b!39948 (= lt!60936 (bitStreamReadBitsIntoList!0 (_2!1997 lt!60931) (_1!1998 lt!60925) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!60916 () List!472)

(assert (=> b!39948 (= lt!60916 (bitStreamReadBitsIntoList!0 (_2!1997 lt!60931) (_1!1998 lt!60929) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60908 () (_ BitVec 64))

(assert (=> b!39948 (= lt!60908 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60912 () Unit!2813)

(assert (=> b!39948 (= lt!60912 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1997 lt!60931) (_2!1997 lt!60931) (_1!1998 lt!60925) (_1!1998 lt!60929) lt!60908 lt!60936))))

(assert (=> b!39948 (= (bitStreamReadBitsIntoList!0 (_2!1997 lt!60931) (_1!1998 lt!60929) (bvsub lt!60908 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!189 lt!60936))))

(declare-fun lt!60900 () Unit!2813)

(assert (=> b!39948 (= lt!60900 lt!60912)))

(declare-fun lt!60922 () (_ BitVec 64))

(declare-fun lt!60932 () Unit!2813)

(assert (=> b!39948 (= lt!60932 (arrayBitRangesEqImpliesEq!0 (buf!1224 (_2!1997 lt!60918)) (buf!1224 (_2!1997 lt!60931)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!60922 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60918))) (currentByte!2636 (_2!1997 lt!60918)) (currentBit!2631 (_2!1997 lt!60918)))))))

(assert (=> b!39948 (= (bitAt!0 (buf!1224 (_2!1997 lt!60918)) lt!60922) (bitAt!0 (buf!1224 (_2!1997 lt!60931)) lt!60922))))

(declare-fun lt!60934 () Unit!2813)

(assert (=> b!39948 (= lt!60934 lt!60932)))

(declare-fun b!39949 () Bool)

(assert (=> b!39949 (= e!26271 (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_2!1997 lt!59985)))) ((_ sign_extend 32) (currentByte!2636 (_2!1997 lt!59985))) ((_ sign_extend 32) (currentBit!2631 (_2!1997 lt!59985))) lt!60897))))

(declare-fun bm!487 () Bool)

(declare-fun c!2735 () Bool)

(assert (=> bm!487 (= call!490 (reader!0 (_2!1997 lt!59985) (ite c!2735 (_2!1997 lt!60931) (_2!1997 lt!59985))))))

(declare-fun b!39950 () Bool)

(declare-fun Unit!2845 () Unit!2813)

(assert (=> b!39950 (= e!26272 (tuple2!3821 Unit!2845 (_2!1997 lt!59985)))))

(assert (=> b!39950 (= (size!896 (buf!1224 (_2!1997 lt!59985))) (size!896 (buf!1224 (_2!1997 lt!59985))))))

(declare-fun lt!60920 () Unit!2813)

(declare-fun Unit!2846 () Unit!2813)

(assert (=> b!39950 (= lt!60920 Unit!2846)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1542 array!1987 array!1987 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39950 (checkByteArrayBitContent!0 (_2!1997 lt!59985) srcBuffer!2 (_1!2009 (readBits!0 (_1!1998 call!490) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!11740 () Bool)

(assert (=> d!11740 e!26273))

(declare-fun res!33942 () Bool)

(assert (=> d!11740 (=> (not res!33942) (not e!26273))))

(declare-fun lt!60914 () (_ BitVec 64))

(assert (=> d!11740 (= res!33942 (= (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!60907))) (currentByte!2636 (_2!1997 lt!60907)) (currentBit!2631 (_2!1997 lt!60907))) (bvsub lt!60914 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11740 (or (= (bvand lt!60914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60914 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!60913 () (_ BitVec 64))

(assert (=> d!11740 (= lt!60914 (bvadd lt!60913 to!314))))

(assert (=> d!11740 (or (not (= (bvand lt!60913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!60913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!60913 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11740 (= lt!60913 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))))))

(assert (=> d!11740 (= lt!60907 e!26272)))

(assert (=> d!11740 (= c!2735 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!60921 () Unit!2813)

(declare-fun lt!60930 () Unit!2813)

(assert (=> d!11740 (= lt!60921 lt!60930)))

(assert (=> d!11740 (isPrefixOf!0 (_2!1997 lt!59985) (_2!1997 lt!59985))))

(assert (=> d!11740 (= lt!60930 (lemmaIsPrefixRefl!0 (_2!1997 lt!59985)))))

(assert (=> d!11740 (= lt!60922 (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59985))) (currentByte!2636 (_2!1997 lt!59985)) (currentBit!2631 (_2!1997 lt!59985))))))

(assert (=> d!11740 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11740 (= (appendBitsMSBFirstLoop!0 (_2!1997 lt!59985) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!60907)))

(declare-fun b!39945 () Bool)

(declare-fun res!33944 () Bool)

(assert (=> b!39945 (=> (not res!33944) (not e!26273))))

(assert (=> b!39945 (= res!33944 (= (size!896 (buf!1224 (_2!1997 lt!59985))) (size!896 (buf!1224 (_2!1997 lt!60907)))))))

(assert (= (and d!11740 c!2735) b!39948))

(assert (= (and d!11740 (not c!2735)) b!39950))

(assert (= (or b!39948 b!39950) bm!487))

(assert (= (and d!11740 res!33942) b!39944))

(assert (= (and b!39944 res!33941) b!39945))

(assert (= (and b!39945 res!33944) b!39943))

(assert (= (and b!39943 res!33946) b!39946))

(assert (= (and b!39946 res!33945) b!39947))

(assert (= (and b!39947 res!33943) b!39949))

(declare-fun m!61025 () Bool)

(assert (=> d!11740 m!61025))

(assert (=> d!11740 m!60345))

(assert (=> d!11740 m!60535))

(assert (=> d!11740 m!60537))

(declare-fun m!61027 () Bool)

(assert (=> b!39947 m!61027))

(declare-fun m!61029 () Bool)

(assert (=> b!39947 m!61029))

(declare-fun m!61031 () Bool)

(assert (=> b!39947 m!61031))

(declare-fun m!61033 () Bool)

(assert (=> b!39947 m!61033))

(declare-fun m!61035 () Bool)

(assert (=> b!39947 m!61035))

(declare-fun m!61037 () Bool)

(assert (=> b!39949 m!61037))

(declare-fun m!61039 () Bool)

(assert (=> b!39948 m!61039))

(declare-fun m!61041 () Bool)

(assert (=> b!39948 m!61041))

(declare-fun m!61043 () Bool)

(assert (=> b!39948 m!61043))

(declare-fun m!61045 () Bool)

(assert (=> b!39948 m!61045))

(declare-fun m!61047 () Bool)

(assert (=> b!39948 m!61047))

(declare-fun m!61049 () Bool)

(assert (=> b!39948 m!61049))

(declare-fun m!61051 () Bool)

(assert (=> b!39948 m!61051))

(assert (=> b!39948 m!61043))

(declare-fun m!61053 () Bool)

(assert (=> b!39948 m!61053))

(declare-fun m!61055 () Bool)

(assert (=> b!39948 m!61055))

(declare-fun m!61057 () Bool)

(assert (=> b!39948 m!61057))

(declare-fun m!61059 () Bool)

(assert (=> b!39948 m!61059))

(assert (=> b!39948 m!60345))

(declare-fun m!61061 () Bool)

(assert (=> b!39948 m!61061))

(declare-fun m!61063 () Bool)

(assert (=> b!39948 m!61063))

(declare-fun m!61065 () Bool)

(assert (=> b!39948 m!61065))

(declare-fun m!61067 () Bool)

(assert (=> b!39948 m!61067))

(declare-fun m!61069 () Bool)

(assert (=> b!39948 m!61069))

(declare-fun m!61071 () Bool)

(assert (=> b!39948 m!61071))

(declare-fun m!61073 () Bool)

(assert (=> b!39948 m!61073))

(declare-fun m!61075 () Bool)

(assert (=> b!39948 m!61075))

(declare-fun m!61077 () Bool)

(assert (=> b!39948 m!61077))

(declare-fun m!61079 () Bool)

(assert (=> b!39948 m!61079))

(declare-fun m!61081 () Bool)

(assert (=> b!39948 m!61081))

(declare-fun m!61083 () Bool)

(assert (=> b!39948 m!61083))

(declare-fun m!61085 () Bool)

(assert (=> b!39948 m!61085))

(declare-fun m!61087 () Bool)

(assert (=> b!39948 m!61087))

(declare-fun m!61089 () Bool)

(assert (=> b!39948 m!61089))

(declare-fun m!61091 () Bool)

(assert (=> b!39948 m!61091))

(declare-fun m!61093 () Bool)

(assert (=> b!39948 m!61093))

(assert (=> b!39948 m!61067))

(declare-fun m!61095 () Bool)

(assert (=> b!39948 m!61095))

(assert (=> b!39948 m!61089))

(declare-fun m!61097 () Bool)

(assert (=> b!39948 m!61097))

(assert (=> b!39948 m!61095))

(declare-fun m!61099 () Bool)

(assert (=> b!39948 m!61099))

(declare-fun m!61101 () Bool)

(assert (=> bm!487 m!61101))

(declare-fun m!61103 () Bool)

(assert (=> b!39944 m!61103))

(declare-fun m!61105 () Bool)

(assert (=> b!39943 m!61105))

(declare-fun m!61107 () Bool)

(assert (=> b!39950 m!61107))

(declare-fun m!61109 () Bool)

(assert (=> b!39950 m!61109))

(assert (=> b!39549 d!11740))

(declare-fun d!11820 () Bool)

(assert (=> d!11820 (isPrefixOf!0 thiss!1379 (_2!1997 lt!59978))))

(declare-fun lt!60940 () Unit!2813)

(declare-fun choose!30 (BitStream!1542 BitStream!1542 BitStream!1542) Unit!2813)

(assert (=> d!11820 (= lt!60940 (choose!30 thiss!1379 (_2!1997 lt!59985) (_2!1997 lt!59978)))))

(assert (=> d!11820 (isPrefixOf!0 thiss!1379 (_2!1997 lt!59985))))

(assert (=> d!11820 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1997 lt!59985) (_2!1997 lt!59978)) lt!60940)))

(declare-fun bs!3136 () Bool)

(assert (= bs!3136 d!11820))

(assert (=> bs!3136 m!60319))

(declare-fun m!61111 () Bool)

(assert (=> bs!3136 m!61111))

(assert (=> bs!3136 m!60339))

(assert (=> b!39549 d!11820))

(declare-fun d!11822 () Bool)

(declare-fun res!33949 () Bool)

(declare-fun e!26277 () Bool)

(assert (=> d!11822 (=> (not res!33949) (not e!26277))))

(assert (=> d!11822 (= res!33949 (= (size!896 (buf!1224 thiss!1379)) (size!896 (buf!1224 (_2!1997 lt!59978)))))))

(assert (=> d!11822 (= (isPrefixOf!0 thiss!1379 (_2!1997 lt!59978)) e!26277)))

(declare-fun b!39953 () Bool)

(declare-fun res!33951 () Bool)

(assert (=> b!39953 (=> (not res!33951) (not e!26277))))

(assert (=> b!39953 (= res!33951 (bvsle (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379)) (bitIndex!0 (size!896 (buf!1224 (_2!1997 lt!59978))) (currentByte!2636 (_2!1997 lt!59978)) (currentBit!2631 (_2!1997 lt!59978)))))))

(declare-fun b!39954 () Bool)

(declare-fun e!26276 () Bool)

(assert (=> b!39954 (= e!26277 e!26276)))

(declare-fun res!33950 () Bool)

(assert (=> b!39954 (=> res!33950 e!26276)))

(assert (=> b!39954 (= res!33950 (= (size!896 (buf!1224 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39955 () Bool)

(assert (=> b!39955 (= e!26276 (arrayBitRangesEq!0 (buf!1224 thiss!1379) (buf!1224 (_2!1997 lt!59978)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!896 (buf!1224 thiss!1379)) (currentByte!2636 thiss!1379) (currentBit!2631 thiss!1379))))))

(assert (= (and d!11822 res!33949) b!39953))

(assert (= (and b!39953 res!33951) b!39954))

(assert (= (and b!39954 (not res!33950)) b!39955))

(assert (=> b!39953 m!60289))

(assert (=> b!39953 m!60291))

(assert (=> b!39955 m!60289))

(assert (=> b!39955 m!60289))

(declare-fun m!61113 () Bool)

(assert (=> b!39955 m!61113))

(assert (=> b!39549 d!11822))

(declare-fun d!11824 () Bool)

(assert (=> d!11824 (= (invariant!0 (currentBit!2631 (_2!1997 lt!59985)) (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59978)))) (and (bvsge (currentBit!2631 (_2!1997 lt!59985)) #b00000000000000000000000000000000) (bvslt (currentBit!2631 (_2!1997 lt!59985)) #b00000000000000000000000000001000) (bvsge (currentByte!2636 (_2!1997 lt!59985)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59978)))) (and (= (currentBit!2631 (_2!1997 lt!59985)) #b00000000000000000000000000000000) (= (currentByte!2636 (_2!1997 lt!59985)) (size!896 (buf!1224 (_2!1997 lt!59978))))))))))

(assert (=> b!39538 d!11824))

(declare-fun d!11826 () Bool)

(declare-fun size!899 (List!472) Int)

(assert (=> d!11826 (= (length!198 lt!59973) (size!899 lt!59973))))

(declare-fun bs!3137 () Bool)

(assert (= bs!3137 d!11826))

(declare-fun m!61119 () Bool)

(assert (=> bs!3137 m!61119))

(assert (=> b!39559 d!11826))

(declare-fun d!11832 () Bool)

(assert (=> d!11832 (= (tail!189 lt!59973) (t!1222 lt!59973))))

(assert (=> b!39548 d!11832))

(declare-fun d!11836 () Bool)

(declare-fun e!26284 () Bool)

(assert (=> d!11836 e!26284))

(declare-fun res!33960 () Bool)

(assert (=> d!11836 (=> (not res!33960) (not e!26284))))

(declare-fun lt!60978 () (_ BitVec 64))

(assert (=> d!11836 (= res!33960 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60978 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!60978) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11836 (= lt!60978 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60977 () Unit!2813)

(declare-fun choose!42 (BitStream!1542 BitStream!1542 BitStream!1542 BitStream!1542 (_ BitVec 64) List!472) Unit!2813)

(assert (=> d!11836 (= lt!60977 (choose!42 (_2!1997 lt!59978) (_2!1997 lt!59978) (_1!1998 lt!59982) (_1!1998 lt!59969) (bvsub to!314 i!635) lt!59973))))

(assert (=> d!11836 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11836 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1997 lt!59978) (_2!1997 lt!59978) (_1!1998 lt!59982) (_1!1998 lt!59969) (bvsub to!314 i!635) lt!59973) lt!60977)))

(declare-fun b!39966 () Bool)

(assert (=> b!39966 (= e!26284 (= (bitStreamReadBitsIntoList!0 (_2!1997 lt!59978) (_1!1998 lt!59969) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!189 lt!59973)))))

(assert (= (and d!11836 res!33960) b!39966))

(declare-fun m!61155 () Bool)

(assert (=> d!11836 m!61155))

(declare-fun m!61157 () Bool)

(assert (=> b!39966 m!61157))

(assert (=> b!39966 m!60293))

(assert (=> b!39548 d!11836))

(declare-fun d!11850 () Bool)

(assert (=> d!11850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!896 (buf!1224 (_1!1998 lt!59982)))) ((_ sign_extend 32) (currentByte!2636 (_1!1998 lt!59982))) ((_ sign_extend 32) (currentBit!2631 (_1!1998 lt!59982))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!896 (buf!1224 (_1!1998 lt!59982)))) ((_ sign_extend 32) (currentByte!2636 (_1!1998 lt!59982))) ((_ sign_extend 32) (currentBit!2631 (_1!1998 lt!59982)))) (bvsub to!314 i!635)))))

(declare-fun bs!3141 () Bool)

(assert (= bs!3141 d!11850))

(declare-fun m!61159 () Bool)

(assert (=> bs!3141 m!61159))

(assert (=> b!39539 d!11850))

(check-sat (not b!39673) (not b!39760) (not b!39753) (not b!39943) (not d!11740) (not b!39758) (not b!39755) (not b!39677) (not d!11654) (not b!39752) (not b!39641) (not b!39944) (not b!39953) (not b!39679) (not d!11736) (not b!39966) (not d!11686) (not b!39762) (not b!39767) (not d!11738) (not b!39672) (not b!39690) (not b!39675) (not b!39764) (not d!11820) (not d!11826) (not b!39774) (not b!39950) (not d!11636) (not b!39757) (not b!39754) (not d!11658) (not d!11690) (not b!39771) (not b!39657) (not d!11734) (not d!11634) (not b!39674) (not b!39949) (not b!39763) (not b!39947) (not d!11640) (not d!11648) (not d!11646) (not d!11850) (not b!39687) (not b!39655) (not d!11688) (not b!39669) (not d!11656) (not b!39770) (not b!39751) (not d!11836) (not b!39670) (not d!11660) (not d!11674) (not d!11630) (not b!39948) (not d!11652) (not bm!487) (not b!39681) (not b!39656) (not b!39769) (not b!39693) (not b!39680) (not d!11644) (not b!39955) (not d!11730) (not b!39643) (not b!39688) (not b!39772) (not b!39756) (not b!39668))
(check-sat)
