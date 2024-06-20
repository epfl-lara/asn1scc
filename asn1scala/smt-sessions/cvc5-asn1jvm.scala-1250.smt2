; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35380 () Bool)

(assert start!35380)

(declare-fun b!165533 () Bool)

(declare-fun res!137877 () Bool)

(declare-fun e!114570 () Bool)

(assert (=> b!165533 (=> (not res!137877) (not e!114570))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-datatypes ((array!8430 0))(
  ( (array!8431 (arr!4684 (Array (_ BitVec 32) (_ BitVec 8))) (size!3763 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6682 0))(
  ( (BitStream!6683 (buf!4215 array!8430) (currentByte!7897 (_ BitVec 32)) (currentBit!7892 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11516 0))(
  ( (Unit!11517) )
))
(declare-datatypes ((tuple2!14576 0))(
  ( (tuple2!14577 (_1!7879 Unit!11516) (_2!7879 BitStream!6682)) )
))
(declare-fun lt!258841 () tuple2!14576)

(declare-fun thiss!1577 () BitStream!6682)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165533 (= res!137877 (= (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841))) (bvadd (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) ((_ sign_extend 32) nBits!511))))))

(declare-fun b!165534 () Bool)

(declare-fun e!114566 () Bool)

(declare-fun array_inv!3504 (array!8430) Bool)

(assert (=> b!165534 (= e!114566 (array_inv!3504 (buf!4215 thiss!1577)))))

(declare-fun b!165535 () Bool)

(declare-datatypes ((tuple2!14578 0))(
  ( (tuple2!14579 (_1!7880 BitStream!6682) (_2!7880 BitStream!6682)) )
))
(declare-fun lt!258842 () tuple2!14578)

(declare-datatypes ((tuple2!14580 0))(
  ( (tuple2!14581 (_1!7881 BitStream!6682) (_2!7881 (_ BitVec 8))) )
))
(declare-fun lt!258840 () tuple2!14580)

(declare-fun lt!258838 () (_ BitVec 8))

(assert (=> b!165535 (= e!114570 (and (= ((_ sign_extend 24) (_2!7881 lt!258840)) ((_ sign_extend 24) lt!258838)) (= (_1!7881 lt!258840) (_2!7880 lt!258842))))))

(declare-fun readPartialBytePure!0 (BitStream!6682 (_ BitVec 32)) tuple2!14580)

(assert (=> b!165535 (= lt!258840 (readPartialBytePure!0 (_1!7880 lt!258842) nBits!511))))

(declare-fun reader!0 (BitStream!6682 BitStream!6682) tuple2!14578)

(assert (=> b!165535 (= lt!258842 (reader!0 thiss!1577 (_2!7879 lt!258841)))))

(declare-fun res!137878 () Bool)

(declare-fun e!114565 () Bool)

(assert (=> start!35380 (=> (not res!137878) (not e!114565))))

(assert (=> start!35380 (= res!137878 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35380 e!114565))

(assert (=> start!35380 true))

(declare-fun inv!12 (BitStream!6682) Bool)

(assert (=> start!35380 (and (inv!12 thiss!1577) e!114566)))

(declare-fun b!165536 () Bool)

(declare-fun res!137882 () Bool)

(assert (=> b!165536 (=> (not res!137882) (not e!114570))))

(declare-fun isPrefixOf!0 (BitStream!6682 BitStream!6682) Bool)

(assert (=> b!165536 (= res!137882 (isPrefixOf!0 thiss!1577 (_2!7879 lt!258841)))))

(declare-fun b!165537 () Bool)

(declare-fun e!114568 () Bool)

(assert (=> b!165537 (= e!114568 e!114570)))

(declare-fun res!137876 () Bool)

(assert (=> b!165537 (=> (not res!137876) (not e!114570))))

(assert (=> b!165537 (= res!137876 (= (size!3763 (buf!4215 thiss!1577)) (size!3763 (buf!4215 (_2!7879 lt!258841)))))))

(declare-fun lt!258839 () array!8430)

(declare-fun moveBitIndex!0 (BitStream!6682 (_ BitVec 64)) tuple2!14576)

(assert (=> b!165537 (= lt!258841 (moveBitIndex!0 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165538 () Bool)

(declare-fun e!114567 () Bool)

(assert (=> b!165538 (= e!114567 (not e!114568))))

(declare-fun res!137880 () Bool)

(assert (=> b!165538 (=> res!137880 e!114568)))

(declare-fun lt!258836 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165538 (= res!137880 (not (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577)) lt!258836 #b00000000000000000000000000000000 (currentBit!7892 thiss!1577))))))

(declare-fun arrayRangesEq!643 (array!8430 array!8430 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165538 (arrayRangesEq!643 (buf!4215 thiss!1577) lt!258839 #b00000000000000000000000000000000 (currentByte!7897 thiss!1577))))

(declare-fun lt!258837 () Unit!11516)

(declare-fun arrayUpdatedAtPrefixLemma!251 (array!8430 (_ BitVec 32) (_ BitVec 8)) Unit!11516)

(assert (=> b!165538 (= lt!258837 (arrayUpdatedAtPrefixLemma!251 (buf!4215 thiss!1577) (currentByte!7897 thiss!1577) lt!258836))))

(assert (=> b!165538 (= lt!258839 (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577))))))

(declare-fun lt!258843 () (_ BitVec 32))

(assert (=> b!165538 (= lt!258836 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7892 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258843)))))) (bvshl ((_ sign_extend 24) lt!258838) lt!258843))))))

(assert (=> b!165538 (= lt!258843 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7892 thiss!1577) nBits!511)))))

(declare-fun b!165539 () Bool)

(assert (=> b!165539 (= e!114565 e!114567)))

(declare-fun res!137881 () Bool)

(assert (=> b!165539 (=> (not res!137881) (not e!114567))))

(assert (=> b!165539 (= res!137881 (bvsle (bvadd (currentBit!7892 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165539 (= lt!258838 ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))))))

(declare-fun b!165540 () Bool)

(declare-fun res!137879 () Bool)

(assert (=> b!165540 (=> (not res!137879) (not e!114565))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165540 (= res!137879 (validate_offset_bits!1 ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))) ((_ sign_extend 32) (currentByte!7897 thiss!1577)) ((_ sign_extend 32) (currentBit!7892 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35380 res!137878) b!165540))

(assert (= (and b!165540 res!137879) b!165539))

(assert (= (and b!165539 res!137881) b!165538))

(assert (= (and b!165538 (not res!137880)) b!165537))

(assert (= (and b!165537 res!137876) b!165533))

(assert (= (and b!165533 res!137877) b!165536))

(assert (= (and b!165536 res!137882) b!165535))

(assert (= start!35380 b!165534))

(declare-fun m!263035 () Bool)

(assert (=> b!165534 m!263035))

(declare-fun m!263037 () Bool)

(assert (=> b!165539 m!263037))

(declare-fun m!263039 () Bool)

(assert (=> b!165537 m!263039))

(declare-fun m!263041 () Bool)

(assert (=> start!35380 m!263041))

(declare-fun m!263043 () Bool)

(assert (=> b!165540 m!263043))

(declare-fun m!263045 () Bool)

(assert (=> b!165535 m!263045))

(declare-fun m!263047 () Bool)

(assert (=> b!165535 m!263047))

(declare-fun m!263049 () Bool)

(assert (=> b!165533 m!263049))

(declare-fun m!263051 () Bool)

(assert (=> b!165533 m!263051))

(declare-fun m!263053 () Bool)

(assert (=> b!165538 m!263053))

(declare-fun m!263055 () Bool)

(assert (=> b!165538 m!263055))

(assert (=> b!165538 m!263055))

(declare-fun m!263057 () Bool)

(assert (=> b!165538 m!263057))

(declare-fun m!263059 () Bool)

(assert (=> b!165538 m!263059))

(declare-fun m!263061 () Bool)

(assert (=> b!165538 m!263061))

(declare-fun m!263063 () Bool)

(assert (=> b!165538 m!263063))

(declare-fun m!263065 () Bool)

(assert (=> b!165538 m!263065))

(declare-fun m!263067 () Bool)

(assert (=> b!165536 m!263067))

(push 1)

(assert (not b!165534))

(assert (not b!165537))

(assert (not b!165538))

(assert (not b!165540))

(assert (not b!165536))

(assert (not b!165535))

(assert (not b!165533))

(assert (not start!35380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57349 () Bool)

(declare-fun res!137942 () Bool)

(declare-fun e!114620 () Bool)

(assert (=> d!57349 (=> (not res!137942) (not e!114620))))

(assert (=> d!57349 (= res!137942 (= (size!3763 (buf!4215 thiss!1577)) (size!3763 (buf!4215 (_2!7879 lt!258841)))))))

(assert (=> d!57349 (= (isPrefixOf!0 thiss!1577 (_2!7879 lt!258841)) e!114620)))

(declare-fun b!165604 () Bool)

(declare-fun res!137940 () Bool)

(assert (=> b!165604 (=> (not res!137940) (not e!114620))))

(assert (=> b!165604 (= res!137940 (bvsle (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))))))

(declare-fun b!165605 () Bool)

(declare-fun e!114621 () Bool)

(assert (=> b!165605 (= e!114620 e!114621)))

(declare-fun res!137941 () Bool)

(assert (=> b!165605 (=> res!137941 e!114621)))

(assert (=> b!165605 (= res!137941 (= (size!3763 (buf!4215 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!165606 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8430 array!8430 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165606 (= e!114621 (arrayBitRangesEq!0 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(assert (= (and d!57349 res!137942) b!165604))

(assert (= (and b!165604 res!137940) b!165605))

(assert (= (and b!165605 (not res!137941)) b!165606))

(assert (=> b!165604 m!263051))

(assert (=> b!165604 m!263049))

(assert (=> b!165606 m!263051))

(assert (=> b!165606 m!263051))

(declare-fun m!263153 () Bool)

(assert (=> b!165606 m!263153))

(assert (=> b!165536 d!57349))

(declare-fun d!57351 () Bool)

(declare-datatypes ((tuple2!14596 0))(
  ( (tuple2!14597 (_1!7889 (_ BitVec 8)) (_2!7889 BitStream!6682)) )
))
(declare-fun lt!258897 () tuple2!14596)

(declare-fun readPartialByte!0 (BitStream!6682 (_ BitVec 32)) tuple2!14596)

(assert (=> d!57351 (= lt!258897 (readPartialByte!0 (_1!7880 lt!258842) nBits!511))))

(assert (=> d!57351 (= (readPartialBytePure!0 (_1!7880 lt!258842) nBits!511) (tuple2!14581 (_2!7889 lt!258897) (_1!7889 lt!258897)))))

(declare-fun bs!14250 () Bool)

(assert (= bs!14250 d!57351))

(declare-fun m!263155 () Bool)

(assert (=> bs!14250 m!263155))

(assert (=> b!165535 d!57351))

(declare-fun b!165623 () Bool)

(declare-fun res!137955 () Bool)

(declare-fun e!114632 () Bool)

(assert (=> b!165623 (=> (not res!137955) (not e!114632))))

(declare-fun lt!258971 () tuple2!14578)

(assert (=> b!165623 (= res!137955 (isPrefixOf!0 (_2!7880 lt!258971) (_2!7879 lt!258841)))))

(declare-fun b!165624 () Bool)

(declare-fun e!114633 () Unit!11516)

(declare-fun Unit!11529 () Unit!11516)

(assert (=> b!165624 (= e!114633 Unit!11529)))

(declare-fun d!57353 () Bool)

(assert (=> d!57353 e!114632))

(declare-fun res!137956 () Bool)

(assert (=> d!57353 (=> (not res!137956) (not e!114632))))

(assert (=> d!57353 (= res!137956 (isPrefixOf!0 (_1!7880 lt!258971) (_2!7880 lt!258971)))))

(declare-fun lt!258964 () BitStream!6682)

(assert (=> d!57353 (= lt!258971 (tuple2!14579 lt!258964 (_2!7879 lt!258841)))))

(declare-fun lt!258969 () Unit!11516)

(declare-fun lt!258977 () Unit!11516)

(assert (=> d!57353 (= lt!258969 lt!258977)))

(assert (=> d!57353 (isPrefixOf!0 lt!258964 (_2!7879 lt!258841))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6682 BitStream!6682 BitStream!6682) Unit!11516)

(assert (=> d!57353 (= lt!258977 (lemmaIsPrefixTransitive!0 lt!258964 (_2!7879 lt!258841) (_2!7879 lt!258841)))))

(declare-fun lt!258973 () Unit!11516)

(declare-fun lt!258962 () Unit!11516)

(assert (=> d!57353 (= lt!258973 lt!258962)))

(assert (=> d!57353 (isPrefixOf!0 lt!258964 (_2!7879 lt!258841))))

(assert (=> d!57353 (= lt!258962 (lemmaIsPrefixTransitive!0 lt!258964 thiss!1577 (_2!7879 lt!258841)))))

(declare-fun lt!258978 () Unit!11516)

(assert (=> d!57353 (= lt!258978 e!114633)))

(declare-fun c!8588 () Bool)

(assert (=> d!57353 (= c!8588 (not (= (size!3763 (buf!4215 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!258966 () Unit!11516)

(declare-fun lt!258963 () Unit!11516)

(assert (=> d!57353 (= lt!258966 lt!258963)))

(assert (=> d!57353 (isPrefixOf!0 (_2!7879 lt!258841) (_2!7879 lt!258841))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6682) Unit!11516)

(assert (=> d!57353 (= lt!258963 (lemmaIsPrefixRefl!0 (_2!7879 lt!258841)))))

(declare-fun lt!258960 () Unit!11516)

(declare-fun lt!258961 () Unit!11516)

(assert (=> d!57353 (= lt!258960 lt!258961)))

(assert (=> d!57353 (= lt!258961 (lemmaIsPrefixRefl!0 (_2!7879 lt!258841)))))

(declare-fun lt!258970 () Unit!11516)

(declare-fun lt!258965 () Unit!11516)

(assert (=> d!57353 (= lt!258970 lt!258965)))

(assert (=> d!57353 (isPrefixOf!0 lt!258964 lt!258964)))

(assert (=> d!57353 (= lt!258965 (lemmaIsPrefixRefl!0 lt!258964))))

(declare-fun lt!258975 () Unit!11516)

(declare-fun lt!258959 () Unit!11516)

(assert (=> d!57353 (= lt!258975 lt!258959)))

(assert (=> d!57353 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!57353 (= lt!258959 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!57353 (= lt!258964 (BitStream!6683 (buf!4215 (_2!7879 lt!258841)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))

(assert (=> d!57353 (isPrefixOf!0 thiss!1577 (_2!7879 lt!258841))))

(assert (=> d!57353 (= (reader!0 thiss!1577 (_2!7879 lt!258841)) lt!258971)))

(declare-fun b!165625 () Bool)

(declare-fun lt!258974 () Unit!11516)

(assert (=> b!165625 (= e!114633 lt!258974)))

(declare-fun lt!258967 () (_ BitVec 64))

(assert (=> b!165625 (= lt!258967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!258972 () (_ BitVec 64))

(assert (=> b!165625 (= lt!258972 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8430 array!8430 (_ BitVec 64) (_ BitVec 64)) Unit!11516)

(assert (=> b!165625 (= lt!258974 (arrayBitRangesEqSymmetric!0 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) lt!258967 lt!258972))))

(assert (=> b!165625 (arrayBitRangesEq!0 (buf!4215 (_2!7879 lt!258841)) (buf!4215 thiss!1577) lt!258967 lt!258972)))

(declare-fun lt!258976 () (_ BitVec 64))

(declare-fun lt!258968 () (_ BitVec 64))

(declare-fun b!165626 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!6682 (_ BitVec 64)) BitStream!6682)

(assert (=> b!165626 (= e!114632 (= (_1!7880 lt!258971) (withMovedBitIndex!0 (_2!7880 lt!258971) (bvsub lt!258976 lt!258968))))))

(assert (=> b!165626 (or (= (bvand lt!258976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!258968 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!258976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258976 lt!258968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165626 (= lt!258968 (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841))))))

(assert (=> b!165626 (= lt!258976 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))

(declare-fun b!165627 () Bool)

(declare-fun res!137957 () Bool)

(assert (=> b!165627 (=> (not res!137957) (not e!114632))))

(assert (=> b!165627 (= res!137957 (isPrefixOf!0 (_1!7880 lt!258971) thiss!1577))))

(assert (= (and d!57353 c!8588) b!165625))

(assert (= (and d!57353 (not c!8588)) b!165624))

(assert (= (and d!57353 res!137956) b!165627))

(assert (= (and b!165627 res!137957) b!165623))

(assert (= (and b!165623 res!137955) b!165626))

(declare-fun m!263165 () Bool)

(assert (=> b!165627 m!263165))

(declare-fun m!263167 () Bool)

(assert (=> b!165626 m!263167))

(assert (=> b!165626 m!263049))

(assert (=> b!165626 m!263051))

(assert (=> b!165625 m!263051))

(declare-fun m!263169 () Bool)

(assert (=> b!165625 m!263169))

(declare-fun m!263171 () Bool)

(assert (=> b!165625 m!263171))

(declare-fun m!263173 () Bool)

(assert (=> d!57353 m!263173))

(declare-fun m!263175 () Bool)

(assert (=> d!57353 m!263175))

(declare-fun m!263177 () Bool)

(assert (=> d!57353 m!263177))

(assert (=> d!57353 m!263067))

(declare-fun m!263179 () Bool)

(assert (=> d!57353 m!263179))

(declare-fun m!263181 () Bool)

(assert (=> d!57353 m!263181))

(declare-fun m!263183 () Bool)

(assert (=> d!57353 m!263183))

(declare-fun m!263185 () Bool)

(assert (=> d!57353 m!263185))

(declare-fun m!263187 () Bool)

(assert (=> d!57353 m!263187))

(declare-fun m!263189 () Bool)

(assert (=> d!57353 m!263189))

(declare-fun m!263191 () Bool)

(assert (=> d!57353 m!263191))

(declare-fun m!263193 () Bool)

(assert (=> b!165623 m!263193))

(assert (=> b!165535 d!57353))

(declare-fun d!57361 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57361 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))) ((_ sign_extend 32) (currentByte!7897 thiss!1577)) ((_ sign_extend 32) (currentBit!7892 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))) ((_ sign_extend 32) (currentByte!7897 thiss!1577)) ((_ sign_extend 32) (currentBit!7892 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14252 () Bool)

(assert (= bs!14252 d!57361))

(declare-fun m!263195 () Bool)

(assert (=> bs!14252 m!263195))

(assert (=> b!165540 d!57361))

(declare-fun d!57363 () Bool)

(assert (=> d!57363 (= (array_inv!3504 (buf!4215 thiss!1577)) (bvsge (size!3763 (buf!4215 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165534 d!57363))

(declare-fun d!57365 () Bool)

(declare-fun e!114646 () Bool)

(assert (=> d!57365 e!114646))

(declare-fun res!137979 () Bool)

(assert (=> d!57365 (=> (not res!137979) (not e!114646))))

(declare-fun lt!259076 () (_ BitVec 64))

(declare-fun lt!259079 () (_ BitVec 64))

(declare-fun lt!259075 () (_ BitVec 64))

(assert (=> d!57365 (= res!137979 (= lt!259075 (bvsub lt!259076 lt!259079)))))

(assert (=> d!57365 (or (= (bvand lt!259076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259076 lt!259079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57365 (= lt!259079 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!258841)))) ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!258841))) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!258841)))))))

(declare-fun lt!259077 () (_ BitVec 64))

(declare-fun lt!259080 () (_ BitVec 64))

(assert (=> d!57365 (= lt!259076 (bvmul lt!259077 lt!259080))))

(assert (=> d!57365 (or (= lt!259077 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259080 (bvsdiv (bvmul lt!259077 lt!259080) lt!259077)))))

(assert (=> d!57365 (= lt!259080 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57365 (= lt!259077 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!258841)))))))

(assert (=> d!57365 (= lt!259075 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!258841))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!258841)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57365 (invariant!0 (currentBit!7892 (_2!7879 lt!258841)) (currentByte!7897 (_2!7879 lt!258841)) (size!3763 (buf!4215 (_2!7879 lt!258841))))))

(assert (=> d!57365 (= (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841))) lt!259075)))

(declare-fun b!165655 () Bool)

(declare-fun res!137980 () Bool)

(assert (=> b!165655 (=> (not res!137980) (not e!114646))))

(assert (=> b!165655 (= res!137980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259075))))

(declare-fun b!165656 () Bool)

(declare-fun lt!259078 () (_ BitVec 64))

(assert (=> b!165656 (= e!114646 (bvsle lt!259075 (bvmul lt!259078 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165656 (or (= lt!259078 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259078 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259078)))))

(assert (=> b!165656 (= lt!259078 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!258841)))))))

(assert (= (and d!57365 res!137979) b!165655))

(assert (= (and b!165655 res!137980) b!165656))

(declare-fun m!263235 () Bool)

(assert (=> d!57365 m!263235))

(declare-fun m!263237 () Bool)

(assert (=> d!57365 m!263237))

(assert (=> b!165533 d!57365))

(declare-fun d!57375 () Bool)

(declare-fun e!114647 () Bool)

(assert (=> d!57375 e!114647))

(declare-fun res!137981 () Bool)

(assert (=> d!57375 (=> (not res!137981) (not e!114647))))

(declare-fun lt!259085 () (_ BitVec 64))

(declare-fun lt!259081 () (_ BitVec 64))

(declare-fun lt!259082 () (_ BitVec 64))

(assert (=> d!57375 (= res!137981 (= lt!259081 (bvsub lt!259082 lt!259085)))))

(assert (=> d!57375 (or (= (bvand lt!259082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259085 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259082 lt!259085) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57375 (= lt!259085 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))) ((_ sign_extend 32) (currentByte!7897 thiss!1577)) ((_ sign_extend 32) (currentBit!7892 thiss!1577))))))

(declare-fun lt!259083 () (_ BitVec 64))

(declare-fun lt!259086 () (_ BitVec 64))

(assert (=> d!57375 (= lt!259082 (bvmul lt!259083 lt!259086))))

(assert (=> d!57375 (or (= lt!259083 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259086 (bvsdiv (bvmul lt!259083 lt!259086) lt!259083)))))

(assert (=> d!57375 (= lt!259086 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57375 (= lt!259083 ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))))))

(assert (=> d!57375 (= lt!259081 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 thiss!1577))))))

(assert (=> d!57375 (invariant!0 (currentBit!7892 thiss!1577) (currentByte!7897 thiss!1577) (size!3763 (buf!4215 thiss!1577)))))

(assert (=> d!57375 (= (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) lt!259081)))

(declare-fun b!165657 () Bool)

(declare-fun res!137982 () Bool)

(assert (=> b!165657 (=> (not res!137982) (not e!114647))))

(assert (=> b!165657 (= res!137982 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259081))))

(declare-fun b!165658 () Bool)

(declare-fun lt!259084 () (_ BitVec 64))

(assert (=> b!165658 (= e!114647 (bvsle lt!259081 (bvmul lt!259084 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165658 (or (= lt!259084 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259084 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259084)))))

(assert (=> b!165658 (= lt!259084 ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))))))

(assert (= (and d!57375 res!137981) b!165657))

(assert (= (and b!165657 res!137982) b!165658))

(assert (=> d!57375 m!263195))

(declare-fun m!263239 () Bool)

(assert (=> d!57375 m!263239))

(assert (=> b!165533 d!57375))

(declare-fun d!57377 () Bool)

(assert (=> d!57377 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7892 thiss!1577) (currentByte!7897 thiss!1577) (size!3763 (buf!4215 thiss!1577))))))

(declare-fun bs!14253 () Bool)

(assert (= bs!14253 d!57377))

(assert (=> bs!14253 m!263239))

(assert (=> start!35380 d!57377))

(declare-fun d!57379 () Bool)

(assert (=> d!57379 (= (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577)) lt!258836 #b00000000000000000000000000000000 (currentBit!7892 thiss!1577)) (or (= #b00000000000000000000000000000000 (currentBit!7892 thiss!1577)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7892 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!258836) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7892 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14255 () Bool)

(assert (= bs!14255 d!57379))

(declare-fun m!263251 () Bool)

(assert (=> bs!14255 m!263251))

(declare-fun m!263253 () Bool)

(assert (=> bs!14255 m!263253))

(assert (=> b!165538 d!57379))

(declare-fun d!57385 () Bool)

(declare-fun res!138001 () Bool)

(declare-fun e!114663 () Bool)

(assert (=> d!57385 (=> res!138001 e!114663)))

(assert (=> d!57385 (= res!138001 (= #b00000000000000000000000000000000 (currentByte!7897 thiss!1577)))))

(assert (=> d!57385 (= (arrayRangesEq!643 (buf!4215 thiss!1577) lt!258839 #b00000000000000000000000000000000 (currentByte!7897 thiss!1577)) e!114663)))

(declare-fun b!165677 () Bool)

(declare-fun e!114664 () Bool)

(assert (=> b!165677 (= e!114663 e!114664)))

(declare-fun res!138002 () Bool)

(assert (=> b!165677 (=> (not res!138002) (not e!114664))))

(assert (=> b!165677 (= res!138002 (= (select (arr!4684 (buf!4215 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4684 lt!258839) #b00000000000000000000000000000000)))))

(declare-fun b!165678 () Bool)

(assert (=> b!165678 (= e!114664 (arrayRangesEq!643 (buf!4215 thiss!1577) lt!258839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (= (and d!57385 (not res!138001)) b!165677))

(assert (= (and b!165677 res!138002) b!165678))

(declare-fun m!263259 () Bool)

(assert (=> b!165677 m!263259))

(declare-fun m!263261 () Bool)

(assert (=> b!165677 m!263261))

(declare-fun m!263263 () Bool)

(assert (=> b!165678 m!263263))

(assert (=> b!165538 d!57385))

(declare-fun d!57389 () Bool)

(declare-fun e!114673 () Bool)

(assert (=> d!57389 e!114673))

(declare-fun res!138014 () Bool)

(assert (=> d!57389 (=> (not res!138014) (not e!114673))))

(assert (=> d!57389 (= res!138014 (and (bvsge (currentByte!7897 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!7897 thiss!1577) (size!3763 (buf!4215 thiss!1577)))))))

(declare-fun lt!259116 () Unit!11516)

(declare-fun choose!224 (array!8430 (_ BitVec 32) (_ BitVec 8)) Unit!11516)

(assert (=> d!57389 (= lt!259116 (choose!224 (buf!4215 thiss!1577) (currentByte!7897 thiss!1577) lt!258836))))

(assert (=> d!57389 (and (bvsle #b00000000000000000000000000000000 (currentByte!7897 thiss!1577)) (bvslt (currentByte!7897 thiss!1577) (size!3763 (buf!4215 thiss!1577))))))

(assert (=> d!57389 (= (arrayUpdatedAtPrefixLemma!251 (buf!4215 thiss!1577) (currentByte!7897 thiss!1577) lt!258836) lt!259116)))

(declare-fun b!165690 () Bool)

(assert (=> b!165690 (= e!114673 (arrayRangesEq!643 (buf!4215 thiss!1577) (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7897 thiss!1577)))))

(assert (= (and d!57389 res!138014) b!165690))

(declare-fun m!263271 () Bool)

(assert (=> d!57389 m!263271))

(assert (=> b!165690 m!263059))

(declare-fun m!263273 () Bool)

(assert (=> b!165690 m!263273))

(assert (=> b!165538 d!57389))

(declare-fun d!57399 () Bool)

(declare-fun lt!259148 () (_ BitVec 32))

(assert (=> d!57399 (= lt!259148 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259151 () (_ BitVec 32))

(assert (=> d!57399 (= lt!259151 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114687 () Bool)

(assert (=> d!57399 e!114687))

(declare-fun res!138028 () Bool)

(assert (=> d!57399 (=> (not res!138028) (not e!114687))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6682 (_ BitVec 64)) Bool)

(assert (=> d!57399 (= res!138028 (moveBitIndexPrecond!0 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11530 () Unit!11516)

(declare-fun Unit!11531 () Unit!11516)

(declare-fun Unit!11532 () Unit!11516)

(assert (=> d!57399 (= (moveBitIndex!0 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259148) #b00000000000000000000000000000000) (tuple2!14577 Unit!11530 (BitStream!6683 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (bvsub (bvadd (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259151) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259148 (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259148) #b00000000000000000000000000001000) (tuple2!14577 Unit!11531 (BitStream!6683 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (bvadd (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259151 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259148) #b00000000000000000000000000001000))) (tuple2!14577 Unit!11532 (BitStream!6683 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (bvadd (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259151) (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259148))))))))

(declare-fun b!165704 () Bool)

(declare-fun e!114686 () Bool)

(assert (=> b!165704 (= e!114687 e!114686)))

(declare-fun res!138029 () Bool)

(assert (=> b!165704 (=> (not res!138029) (not e!114686))))

(declare-fun lt!259152 () tuple2!14576)

(declare-fun lt!259149 () (_ BitVec 64))

(assert (=> b!165704 (= res!138029 (= (bvadd lt!259149 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!259152))) (currentByte!7897 (_2!7879 lt!259152)) (currentBit!7892 (_2!7879 lt!259152)))))))

(assert (=> b!165704 (or (not (= (bvand lt!259149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259149 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165704 (= lt!259149 (bitIndex!0 (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))))

(declare-fun lt!259147 () (_ BitVec 32))

(declare-fun lt!259150 () (_ BitVec 32))

(declare-fun Unit!11533 () Unit!11516)

(declare-fun Unit!11534 () Unit!11516)

(declare-fun Unit!11535 () Unit!11516)

(assert (=> b!165704 (= lt!259152 (ite (bvslt (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259150) #b00000000000000000000000000000000) (tuple2!14577 Unit!11533 (BitStream!6683 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (bvsub (bvadd (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259147) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259150 (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))) (ite (bvsge (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259150) #b00000000000000000000000000001000) (tuple2!14577 Unit!11534 (BitStream!6683 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (bvadd (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259147 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259150) #b00000000000000000000000000001000))) (tuple2!14577 Unit!11535 (BitStream!6683 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (bvadd (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259147) (bvadd (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) lt!259150))))))))

(assert (=> b!165704 (= lt!259150 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165704 (= lt!259147 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!165705 () Bool)

(assert (=> b!165705 (= e!114686 (and (= (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) (size!3763 (buf!4215 (_2!7879 lt!259152)))) (= (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (buf!4215 (_2!7879 lt!259152)))))))

(assert (= (and d!57399 res!138028) b!165704))

(assert (= (and b!165704 res!138029) b!165705))

(declare-fun m!263283 () Bool)

(assert (=> d!57399 m!263283))

(declare-fun m!263285 () Bool)

(assert (=> b!165704 m!263285))

(declare-fun m!263287 () Bool)

(assert (=> b!165704 m!263287))

(assert (=> b!165537 d!57399))

(push 1)

(assert (not b!165604))

(assert (not b!165678))

(assert (not d!57375))

(assert (not d!57389))

(assert (not d!57361))

(assert (not d!57399))

(assert (not d!57351))

(assert (not b!165623))

(assert (not d!57365))

(assert (not b!165627))

(assert (not b!165606))

(assert (not b!165625))

(assert (not b!165690))

(assert (not b!165704))

(assert (not d!57353))

(assert (not d!57377))

(assert (not b!165626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57523 () Bool)

(assert (=> d!57523 (isPrefixOf!0 thiss!1577 thiss!1577)))

(declare-fun lt!259350 () Unit!11516)

(declare-fun choose!11 (BitStream!6682) Unit!11516)

(assert (=> d!57523 (= lt!259350 (choose!11 thiss!1577))))

(assert (=> d!57523 (= (lemmaIsPrefixRefl!0 thiss!1577) lt!259350)))

(declare-fun bs!14277 () Bool)

(assert (= bs!14277 d!57523))

(assert (=> bs!14277 m!263179))

(declare-fun m!263523 () Bool)

(assert (=> bs!14277 m!263523))

(assert (=> d!57353 d!57523))

(declare-fun d!57525 () Bool)

(assert (=> d!57525 (isPrefixOf!0 (_2!7879 lt!258841) (_2!7879 lt!258841))))

(declare-fun lt!259351 () Unit!11516)

(assert (=> d!57525 (= lt!259351 (choose!11 (_2!7879 lt!258841)))))

(assert (=> d!57525 (= (lemmaIsPrefixRefl!0 (_2!7879 lt!258841)) lt!259351)))

(declare-fun bs!14278 () Bool)

(assert (= bs!14278 d!57525))

(assert (=> bs!14278 m!263181))

(declare-fun m!263525 () Bool)

(assert (=> bs!14278 m!263525))

(assert (=> d!57353 d!57525))

(declare-fun d!57527 () Bool)

(assert (=> d!57527 (isPrefixOf!0 lt!258964 lt!258964)))

(declare-fun lt!259352 () Unit!11516)

(assert (=> d!57527 (= lt!259352 (choose!11 lt!258964))))

(assert (=> d!57527 (= (lemmaIsPrefixRefl!0 lt!258964) lt!259352)))

(declare-fun bs!14279 () Bool)

(assert (= bs!14279 d!57527))

(assert (=> bs!14279 m!263191))

(declare-fun m!263527 () Bool)

(assert (=> bs!14279 m!263527))

(assert (=> d!57353 d!57527))

(declare-fun d!57529 () Bool)

(declare-fun res!138166 () Bool)

(declare-fun e!114812 () Bool)

(assert (=> d!57529 (=> (not res!138166) (not e!114812))))

(assert (=> d!57529 (= res!138166 (= (size!3763 (buf!4215 thiss!1577)) (size!3763 (buf!4215 thiss!1577))))))

(assert (=> d!57529 (= (isPrefixOf!0 thiss!1577 thiss!1577) e!114812)))

(declare-fun b!165876 () Bool)

(declare-fun res!138164 () Bool)

(assert (=> b!165876 (=> (not res!138164) (not e!114812))))

(assert (=> b!165876 (= res!138164 (bvsle (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(declare-fun b!165877 () Bool)

(declare-fun e!114813 () Bool)

(assert (=> b!165877 (= e!114812 e!114813)))

(declare-fun res!138165 () Bool)

(assert (=> b!165877 (=> res!138165 e!114813)))

(assert (=> b!165877 (= res!138165 (= (size!3763 (buf!4215 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!165878 () Bool)

(assert (=> b!165878 (= e!114813 (arrayBitRangesEq!0 (buf!4215 thiss!1577) (buf!4215 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(assert (= (and d!57529 res!138166) b!165876))

(assert (= (and b!165876 res!138164) b!165877))

(assert (= (and b!165877 (not res!138165)) b!165878))

(assert (=> b!165876 m!263051))

(assert (=> b!165876 m!263051))

(assert (=> b!165878 m!263051))

(assert (=> b!165878 m!263051))

(declare-fun m!263529 () Bool)

(assert (=> b!165878 m!263529))

(assert (=> d!57353 d!57529))

(declare-fun d!57531 () Bool)

(assert (=> d!57531 (isPrefixOf!0 lt!258964 (_2!7879 lt!258841))))

(declare-fun lt!259355 () Unit!11516)

(declare-fun choose!30 (BitStream!6682 BitStream!6682 BitStream!6682) Unit!11516)

(assert (=> d!57531 (= lt!259355 (choose!30 lt!258964 (_2!7879 lt!258841) (_2!7879 lt!258841)))))

(assert (=> d!57531 (isPrefixOf!0 lt!258964 (_2!7879 lt!258841))))

(assert (=> d!57531 (= (lemmaIsPrefixTransitive!0 lt!258964 (_2!7879 lt!258841) (_2!7879 lt!258841)) lt!259355)))

(declare-fun bs!14280 () Bool)

(assert (= bs!14280 d!57531))

(assert (=> bs!14280 m!263183))

(declare-fun m!263531 () Bool)

(assert (=> bs!14280 m!263531))

(assert (=> bs!14280 m!263183))

(assert (=> d!57353 d!57531))

(declare-fun d!57533 () Bool)

(declare-fun res!138169 () Bool)

(declare-fun e!114814 () Bool)

(assert (=> d!57533 (=> (not res!138169) (not e!114814))))

(assert (=> d!57533 (= res!138169 (= (size!3763 (buf!4215 (_1!7880 lt!258971))) (size!3763 (buf!4215 (_2!7880 lt!258971)))))))

(assert (=> d!57533 (= (isPrefixOf!0 (_1!7880 lt!258971) (_2!7880 lt!258971)) e!114814)))

(declare-fun b!165879 () Bool)

(declare-fun res!138167 () Bool)

(assert (=> b!165879 (=> (not res!138167) (not e!114814))))

(assert (=> b!165879 (= res!138167 (bvsle (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971))) (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971)))))))

(declare-fun b!165880 () Bool)

(declare-fun e!114815 () Bool)

(assert (=> b!165880 (= e!114814 e!114815)))

(declare-fun res!138168 () Bool)

(assert (=> b!165880 (=> res!138168 e!114815)))

(assert (=> b!165880 (= res!138168 (= (size!3763 (buf!4215 (_1!7880 lt!258971))) #b00000000000000000000000000000000))))

(declare-fun b!165881 () Bool)

(assert (=> b!165881 (= e!114815 (arrayBitRangesEq!0 (buf!4215 (_1!7880 lt!258971)) (buf!4215 (_2!7880 lt!258971)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))))))

(assert (= (and d!57533 res!138169) b!165879))

(assert (= (and b!165879 res!138167) b!165880))

(assert (= (and b!165880 (not res!138168)) b!165881))

(declare-fun m!263533 () Bool)

(assert (=> b!165879 m!263533))

(declare-fun m!263535 () Bool)

(assert (=> b!165879 m!263535))

(assert (=> b!165881 m!263533))

(assert (=> b!165881 m!263533))

(declare-fun m!263537 () Bool)

(assert (=> b!165881 m!263537))

(assert (=> d!57353 d!57533))

(declare-fun d!57535 () Bool)

(declare-fun res!138172 () Bool)

(declare-fun e!114816 () Bool)

(assert (=> d!57535 (=> (not res!138172) (not e!114816))))

(assert (=> d!57535 (= res!138172 (= (size!3763 (buf!4215 lt!258964)) (size!3763 (buf!4215 lt!258964))))))

(assert (=> d!57535 (= (isPrefixOf!0 lt!258964 lt!258964) e!114816)))

(declare-fun b!165882 () Bool)

(declare-fun res!138170 () Bool)

(assert (=> b!165882 (=> (not res!138170) (not e!114816))))

(assert (=> b!165882 (= res!138170 (bvsle (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964)) (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(declare-fun b!165883 () Bool)

(declare-fun e!114817 () Bool)

(assert (=> b!165883 (= e!114816 e!114817)))

(declare-fun res!138171 () Bool)

(assert (=> b!165883 (=> res!138171 e!114817)))

(assert (=> b!165883 (= res!138171 (= (size!3763 (buf!4215 lt!258964)) #b00000000000000000000000000000000))))

(declare-fun b!165884 () Bool)

(assert (=> b!165884 (= e!114817 (arrayBitRangesEq!0 (buf!4215 lt!258964) (buf!4215 lt!258964) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(assert (= (and d!57535 res!138172) b!165882))

(assert (= (and b!165882 res!138170) b!165883))

(assert (= (and b!165883 (not res!138171)) b!165884))

(declare-fun m!263539 () Bool)

(assert (=> b!165882 m!263539))

(assert (=> b!165882 m!263539))

(assert (=> b!165884 m!263539))

(assert (=> b!165884 m!263539))

(declare-fun m!263541 () Bool)

(assert (=> b!165884 m!263541))

(assert (=> d!57353 d!57535))

(declare-fun d!57537 () Bool)

(declare-fun res!138175 () Bool)

(declare-fun e!114818 () Bool)

(assert (=> d!57537 (=> (not res!138175) (not e!114818))))

(assert (=> d!57537 (= res!138175 (= (size!3763 (buf!4215 (_2!7879 lt!258841))) (size!3763 (buf!4215 (_2!7879 lt!258841)))))))

(assert (=> d!57537 (= (isPrefixOf!0 (_2!7879 lt!258841) (_2!7879 lt!258841)) e!114818)))

(declare-fun b!165885 () Bool)

(declare-fun res!138173 () Bool)

(assert (=> b!165885 (=> (not res!138173) (not e!114818))))

(assert (=> b!165885 (= res!138173 (bvsle (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841))) (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))))))

(declare-fun b!165886 () Bool)

(declare-fun e!114819 () Bool)

(assert (=> b!165886 (= e!114818 e!114819)))

(declare-fun res!138174 () Bool)

(assert (=> b!165886 (=> res!138174 e!114819)))

(assert (=> b!165886 (= res!138174 (= (size!3763 (buf!4215 (_2!7879 lt!258841))) #b00000000000000000000000000000000))))

(declare-fun b!165887 () Bool)

(assert (=> b!165887 (= e!114819 (arrayBitRangesEq!0 (buf!4215 (_2!7879 lt!258841)) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))))))

(assert (= (and d!57537 res!138175) b!165885))

(assert (= (and b!165885 res!138173) b!165886))

(assert (= (and b!165886 (not res!138174)) b!165887))

(assert (=> b!165885 m!263049))

(assert (=> b!165885 m!263049))

(assert (=> b!165887 m!263049))

(assert (=> b!165887 m!263049))

(declare-fun m!263543 () Bool)

(assert (=> b!165887 m!263543))

(assert (=> d!57353 d!57537))

(declare-fun d!57539 () Bool)

(assert (=> d!57539 (isPrefixOf!0 lt!258964 (_2!7879 lt!258841))))

(declare-fun lt!259356 () Unit!11516)

(assert (=> d!57539 (= lt!259356 (choose!30 lt!258964 thiss!1577 (_2!7879 lt!258841)))))

(assert (=> d!57539 (isPrefixOf!0 lt!258964 thiss!1577)))

(assert (=> d!57539 (= (lemmaIsPrefixTransitive!0 lt!258964 thiss!1577 (_2!7879 lt!258841)) lt!259356)))

(declare-fun bs!14281 () Bool)

(assert (= bs!14281 d!57539))

(assert (=> bs!14281 m!263183))

(declare-fun m!263545 () Bool)

(assert (=> bs!14281 m!263545))

(declare-fun m!263547 () Bool)

(assert (=> bs!14281 m!263547))

(assert (=> d!57353 d!57539))

(assert (=> d!57353 d!57349))

(declare-fun d!57541 () Bool)

(declare-fun res!138178 () Bool)

(declare-fun e!114820 () Bool)

(assert (=> d!57541 (=> (not res!138178) (not e!114820))))

(assert (=> d!57541 (= res!138178 (= (size!3763 (buf!4215 lt!258964)) (size!3763 (buf!4215 (_2!7879 lt!258841)))))))

(assert (=> d!57541 (= (isPrefixOf!0 lt!258964 (_2!7879 lt!258841)) e!114820)))

(declare-fun b!165888 () Bool)

(declare-fun res!138176 () Bool)

(assert (=> b!165888 (=> (not res!138176) (not e!114820))))

(assert (=> b!165888 (= res!138176 (bvsle (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964)) (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))))))

(declare-fun b!165889 () Bool)

(declare-fun e!114821 () Bool)

(assert (=> b!165889 (= e!114820 e!114821)))

(declare-fun res!138177 () Bool)

(assert (=> b!165889 (=> res!138177 e!114821)))

(assert (=> b!165889 (= res!138177 (= (size!3763 (buf!4215 lt!258964)) #b00000000000000000000000000000000))))

(declare-fun b!165890 () Bool)

(assert (=> b!165890 (= e!114821 (arrayBitRangesEq!0 (buf!4215 lt!258964) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(assert (= (and d!57541 res!138178) b!165888))

(assert (= (and b!165888 res!138176) b!165889))

(assert (= (and b!165889 (not res!138177)) b!165890))

(assert (=> b!165888 m!263539))

(assert (=> b!165888 m!263049))

(assert (=> b!165890 m!263539))

(assert (=> b!165890 m!263539))

(declare-fun m!263549 () Bool)

(assert (=> b!165890 m!263549))

(assert (=> d!57353 d!57541))

(declare-fun d!57543 () Bool)

(assert (=> d!57543 (= (invariant!0 (currentBit!7892 thiss!1577) (currentByte!7897 thiss!1577) (size!3763 (buf!4215 thiss!1577))) (and (bvsge (currentBit!7892 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7892 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7897 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7897 thiss!1577) (size!3763 (buf!4215 thiss!1577))) (and (= (currentBit!7892 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7897 thiss!1577) (size!3763 (buf!4215 thiss!1577)))))))))

(assert (=> d!57377 d!57543))

(declare-fun d!57545 () Bool)

(assert (=> d!57545 (= (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!258841)))) ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!258841))) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!258841)))) (bvsub (bvmul ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!258841)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!258841))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!258841))))))))

(assert (=> d!57365 d!57545))

(declare-fun d!57547 () Bool)

(assert (=> d!57547 (= (invariant!0 (currentBit!7892 (_2!7879 lt!258841)) (currentByte!7897 (_2!7879 lt!258841)) (size!3763 (buf!4215 (_2!7879 lt!258841)))) (and (bvsge (currentBit!7892 (_2!7879 lt!258841)) #b00000000000000000000000000000000) (bvslt (currentBit!7892 (_2!7879 lt!258841)) #b00000000000000000000000000001000) (bvsge (currentByte!7897 (_2!7879 lt!258841)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7897 (_2!7879 lt!258841)) (size!3763 (buf!4215 (_2!7879 lt!258841)))) (and (= (currentBit!7892 (_2!7879 lt!258841)) #b00000000000000000000000000000000) (= (currentByte!7897 (_2!7879 lt!258841)) (size!3763 (buf!4215 (_2!7879 lt!258841))))))))))

(assert (=> d!57365 d!57547))

(declare-fun d!57549 () Bool)

(assert (=> d!57549 (arrayRangesEq!643 (buf!4215 thiss!1577) (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7897 thiss!1577))))

(assert (=> d!57549 true))

(declare-fun _$8!183 () Unit!11516)

(assert (=> d!57549 (= (choose!224 (buf!4215 thiss!1577) (currentByte!7897 thiss!1577) lt!258836) _$8!183)))

(declare-fun bs!14282 () Bool)

(assert (= bs!14282 d!57549))

(assert (=> bs!14282 m!263059))

(assert (=> bs!14282 m!263273))

(assert (=> d!57389 d!57549))

(assert (=> b!165604 d!57375))

(assert (=> b!165604 d!57365))

(declare-fun d!57551 () Bool)

(declare-fun res!138181 () Bool)

(declare-fun e!114824 () Bool)

(assert (=> d!57551 (=> (not res!138181) (not e!114824))))

(assert (=> d!57551 (= res!138181 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))) ((_ sign_extend 32) nBits!511)) (bvsle ((_ sign_extend 32) nBits!511) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))))))))

(assert (=> d!57551 (= (moveBitIndexPrecond!0 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) ((_ sign_extend 32) nBits!511)) e!114824)))

(declare-fun lt!259359 () (_ BitVec 64))

(declare-fun b!165894 () Bool)

(assert (=> b!165894 (= e!114824 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259359) (bvsle lt!259359 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))))))))

(assert (=> b!165894 (= lt!259359 (bvadd (bitIndex!0 (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) ((_ sign_extend 32) nBits!511)))))

(assert (= (and d!57551 res!138181) b!165894))

(assert (=> b!165894 m!263287))

(assert (=> d!57399 d!57551))

(declare-fun d!57553 () Bool)

(declare-fun res!138182 () Bool)

(declare-fun e!114825 () Bool)

(assert (=> d!57553 (=> res!138182 e!114825)))

(assert (=> d!57553 (= res!138182 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (=> d!57553 (= (arrayRangesEq!643 (buf!4215 thiss!1577) lt!258839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)) e!114825)))

(declare-fun b!165895 () Bool)

(declare-fun e!114826 () Bool)

(assert (=> b!165895 (= e!114825 e!114826)))

(declare-fun res!138183 () Bool)

(assert (=> b!165895 (=> (not res!138183) (not e!114826))))

(assert (=> b!165895 (= res!138183 (= (select (arr!4684 (buf!4215 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4684 lt!258839) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!165896 () Bool)

(assert (=> b!165896 (= e!114826 (arrayRangesEq!643 (buf!4215 thiss!1577) lt!258839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (= (and d!57553 (not res!138182)) b!165895))

(assert (= (and b!165895 res!138183) b!165896))

(declare-fun m!263551 () Bool)

(assert (=> b!165895 m!263551))

(declare-fun m!263553 () Bool)

(assert (=> b!165895 m!263553))

(declare-fun m!263555 () Bool)

(assert (=> b!165896 m!263555))

(assert (=> b!165678 d!57553))

(declare-fun d!57555 () Bool)

(declare-fun res!138186 () Bool)

(declare-fun e!114827 () Bool)

(assert (=> d!57555 (=> (not res!138186) (not e!114827))))

(assert (=> d!57555 (= res!138186 (= (size!3763 (buf!4215 (_2!7880 lt!258971))) (size!3763 (buf!4215 (_2!7879 lt!258841)))))))

(assert (=> d!57555 (= (isPrefixOf!0 (_2!7880 lt!258971) (_2!7879 lt!258841)) e!114827)))

(declare-fun b!165897 () Bool)

(declare-fun res!138184 () Bool)

(assert (=> b!165897 (=> (not res!138184) (not e!114827))))

(assert (=> b!165897 (= res!138184 (bvsle (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971))) (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))))))

(declare-fun b!165898 () Bool)

(declare-fun e!114828 () Bool)

(assert (=> b!165898 (= e!114827 e!114828)))

(declare-fun res!138185 () Bool)

(assert (=> b!165898 (=> res!138185 e!114828)))

(assert (=> b!165898 (= res!138185 (= (size!3763 (buf!4215 (_2!7880 lt!258971))) #b00000000000000000000000000000000))))

(declare-fun b!165899 () Bool)

(assert (=> b!165899 (= e!114828 (arrayBitRangesEq!0 (buf!4215 (_2!7880 lt!258971)) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971)))))))

(assert (= (and d!57555 res!138186) b!165897))

(assert (= (and b!165897 res!138184) b!165898))

(assert (= (and b!165898 (not res!138185)) b!165899))

(assert (=> b!165897 m!263535))

(assert (=> b!165897 m!263049))

(assert (=> b!165899 m!263535))

(assert (=> b!165899 m!263535))

(declare-fun m!263557 () Bool)

(assert (=> b!165899 m!263557))

(assert (=> b!165623 d!57555))

(declare-fun d!57557 () Bool)

(declare-fun res!138197 () Bool)

(declare-fun e!114842 () Bool)

(assert (=> d!57557 (=> res!138197 e!114842)))

(assert (=> d!57557 (= res!138197 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(assert (=> d!57557 (= (arrayBitRangesEq!0 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) e!114842)))

(declare-fun b!165914 () Bool)

(declare-fun e!114845 () Bool)

(declare-fun e!114846 () Bool)

(assert (=> b!165914 (= e!114845 e!114846)))

(declare-fun c!8611 () Bool)

(declare-datatypes ((tuple4!244 0))(
  ( (tuple4!245 (_1!7895 (_ BitVec 32)) (_2!7895 (_ BitVec 32)) (_3!595 (_ BitVec 32)) (_4!122 (_ BitVec 32))) )
))
(declare-fun lt!259366 () tuple4!244)

(assert (=> b!165914 (= c!8611 (= (_3!595 lt!259366) (_4!122 lt!259366)))))

(declare-fun b!165915 () Bool)

(declare-fun call!2785 () Bool)

(assert (=> b!165915 (= e!114846 call!2785)))

(declare-fun e!114844 () Bool)

(declare-fun b!165916 () Bool)

(assert (=> b!165916 (= e!114844 (arrayRangesEq!643 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) (_1!7895 lt!259366) (_2!7895 lt!259366)))))

(declare-fun e!114843 () Bool)

(declare-fun lt!259367 () (_ BitVec 32))

(declare-fun b!165917 () Bool)

(assert (=> b!165917 (= e!114843 (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259366)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259366)) #b00000000000000000000000000000000 lt!259367))))

(declare-fun b!165918 () Bool)

(assert (=> b!165918 (= e!114842 e!114845)))

(declare-fun res!138199 () Bool)

(assert (=> b!165918 (=> (not res!138199) (not e!114845))))

(assert (=> b!165918 (= res!138199 e!114844)))

(declare-fun res!138200 () Bool)

(assert (=> b!165918 (=> res!138200 e!114844)))

(assert (=> b!165918 (= res!138200 (bvsge (_1!7895 lt!259366) (_2!7895 lt!259366)))))

(assert (=> b!165918 (= lt!259367 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259368 () (_ BitVec 32))

(assert (=> b!165918 (= lt!259368 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!244)

(assert (=> b!165918 (= lt!259366 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(declare-fun b!165919 () Bool)

(declare-fun res!138201 () Bool)

(assert (=> b!165919 (= res!138201 (= lt!259367 #b00000000000000000000000000000000))))

(assert (=> b!165919 (=> res!138201 e!114843)))

(declare-fun e!114841 () Bool)

(assert (=> b!165919 (= e!114841 e!114843)))

(declare-fun b!165920 () Bool)

(assert (=> b!165920 (= e!114846 e!114841)))

(declare-fun res!138198 () Bool)

(assert (=> b!165920 (= res!138198 call!2785)))

(assert (=> b!165920 (=> (not res!138198) (not e!114841))))

(declare-fun bm!2782 () Bool)

(assert (=> bm!2782 (= call!2785 (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259366)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259366)) lt!259368 (ite c!8611 lt!259367 #b00000000000000000000000000001000)))))

(assert (= (and d!57557 (not res!138197)) b!165918))

(assert (= (and b!165918 (not res!138200)) b!165916))

(assert (= (and b!165918 res!138199) b!165914))

(assert (= (and b!165914 c!8611) b!165915))

(assert (= (and b!165914 (not c!8611)) b!165920))

(assert (= (and b!165920 res!138198) b!165919))

(assert (= (and b!165919 (not res!138201)) b!165917))

(assert (= (or b!165915 b!165920) bm!2782))

(declare-fun m!263559 () Bool)

(assert (=> b!165916 m!263559))

(declare-fun m!263561 () Bool)

(assert (=> b!165917 m!263561))

(declare-fun m!263563 () Bool)

(assert (=> b!165917 m!263563))

(assert (=> b!165917 m!263561))

(assert (=> b!165917 m!263563))

(declare-fun m!263565 () Bool)

(assert (=> b!165917 m!263565))

(assert (=> b!165918 m!263051))

(declare-fun m!263567 () Bool)

(assert (=> b!165918 m!263567))

(declare-fun m!263569 () Bool)

(assert (=> bm!2782 m!263569))

(declare-fun m!263571 () Bool)

(assert (=> bm!2782 m!263571))

(assert (=> bm!2782 m!263569))

(assert (=> bm!2782 m!263571))

(declare-fun m!263573 () Bool)

(assert (=> bm!2782 m!263573))

(assert (=> b!165606 d!57557))

(assert (=> b!165606 d!57375))

(declare-fun d!57559 () Bool)

(assert (=> d!57559 (= (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))) ((_ sign_extend 32) (currentByte!7897 thiss!1577)) ((_ sign_extend 32) (currentBit!7892 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3763 (buf!4215 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 thiss!1577)))))))

(assert (=> d!57375 d!57559))

(assert (=> d!57375 d!57543))

(assert (=> d!57361 d!57559))

(declare-fun d!57561 () Bool)

(declare-fun res!138204 () Bool)

(declare-fun e!114847 () Bool)

(assert (=> d!57561 (=> (not res!138204) (not e!114847))))

(assert (=> d!57561 (= res!138204 (= (size!3763 (buf!4215 (_1!7880 lt!258971))) (size!3763 (buf!4215 thiss!1577))))))

(assert (=> d!57561 (= (isPrefixOf!0 (_1!7880 lt!258971) thiss!1577) e!114847)))

(declare-fun b!165921 () Bool)

(declare-fun res!138202 () Bool)

(assert (=> b!165921 (=> (not res!138202) (not e!114847))))

(assert (=> b!165921 (= res!138202 (bvsle (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971))) (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(declare-fun b!165922 () Bool)

(declare-fun e!114848 () Bool)

(assert (=> b!165922 (= e!114847 e!114848)))

(declare-fun res!138203 () Bool)

(assert (=> b!165922 (=> res!138203 e!114848)))

(assert (=> b!165922 (= res!138203 (= (size!3763 (buf!4215 (_1!7880 lt!258971))) #b00000000000000000000000000000000))))

(declare-fun b!165923 () Bool)

(assert (=> b!165923 (= e!114848 (arrayBitRangesEq!0 (buf!4215 (_1!7880 lt!258971)) (buf!4215 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))))))

(assert (= (and d!57561 res!138204) b!165921))

(assert (= (and b!165921 res!138202) b!165922))

(assert (= (and b!165922 (not res!138203)) b!165923))

(assert (=> b!165921 m!263533))

(assert (=> b!165921 m!263051))

(assert (=> b!165923 m!263533))

(assert (=> b!165923 m!263533))

(declare-fun m!263575 () Bool)

(assert (=> b!165923 m!263575))

(assert (=> b!165627 d!57561))

(declare-fun d!57563 () Bool)

(declare-fun e!114854 () Bool)

(assert (=> d!57563 e!114854))

(declare-fun res!138207 () Bool)

(assert (=> d!57563 (=> (not res!138207) (not e!114854))))

(declare-fun lt!259384 () tuple2!14596)

(assert (=> d!57563 (= res!138207 (= (buf!4215 (_2!7889 lt!259384)) (buf!4215 (_1!7880 lt!258842))))))

(declare-datatypes ((tuple3!946 0))(
  ( (tuple3!947 (_1!7896 Unit!11516) (_2!7896 (_ BitVec 8)) (_3!596 BitStream!6682)) )
))
(declare-fun lt!259383 () tuple3!946)

(assert (=> d!57563 (= lt!259384 (tuple2!14597 (_2!7896 lt!259383) (_3!596 lt!259383)))))

(declare-fun e!114853 () tuple3!946)

(assert (=> d!57563 (= lt!259383 e!114853)))

(declare-fun c!8614 () Bool)

(declare-fun lt!259389 () (_ BitVec 32))

(assert (=> d!57563 (= c!8614 (bvsle lt!259389 #b00000000000000000000000000001000))))

(assert (=> d!57563 (= lt!259389 (bvadd (currentBit!7892 (_1!7880 lt!258842)) nBits!511))))

(assert (=> d!57563 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000))))

(assert (=> d!57563 (= (readPartialByte!0 (_1!7880 lt!258842) nBits!511) lt!259384)))

(declare-fun lt!259388 () tuple2!14576)

(declare-fun b!165930 () Bool)

(assert (=> b!165930 (= e!114853 (tuple3!947 (_1!7879 lt!259388) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4684 (buf!4215 (_1!7880 lt!258842))) (currentByte!7897 (_1!7880 lt!258842)))) (bvsub #b00000000000000000000000000001000 lt!259389)) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (_2!7879 lt!259388)))))

(assert (=> b!165930 (= lt!259388 (moveBitIndex!0 (_1!7880 lt!258842) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165931 () Bool)

(declare-fun lt!259385 () (_ BitVec 32))

(declare-fun Unit!11545 () Unit!11516)

(assert (=> b!165931 (= e!114853 (tuple3!947 Unit!11545 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4684 (buf!4215 (_1!7880 lt!258842))) (currentByte!7897 (_1!7880 lt!258842)))) lt!259385))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 (_1!7880 lt!258842))) (bvadd (currentByte!7897 (_1!7880 lt!258842)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!259385))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (BitStream!6683 (buf!4215 (_1!7880 lt!258842)) (bvadd (currentByte!7897 (_1!7880 lt!258842)) #b00000000000000000000000000000001) lt!259385)))))

(assert (=> b!165931 (= lt!259385 (bvsub lt!259389 #b00000000000000000000000000001000))))

(declare-fun lt!259387 () (_ BitVec 64))

(declare-fun b!165932 () Bool)

(declare-fun lt!259386 () (_ BitVec 64))

(assert (=> b!165932 (= e!114854 (= (bitIndex!0 (size!3763 (buf!4215 (_2!7889 lt!259384))) (currentByte!7897 (_2!7889 lt!259384)) (currentBit!7892 (_2!7889 lt!259384))) (bvadd lt!259386 lt!259387)))))

(assert (=> b!165932 (or (not (= (bvand lt!259386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259387 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259386 lt!259387) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165932 (= lt!259387 ((_ sign_extend 32) nBits!511))))

(assert (=> b!165932 (= lt!259386 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258842))) (currentByte!7897 (_1!7880 lt!258842)) (currentBit!7892 (_1!7880 lt!258842))))))

(assert (= (and d!57563 c!8614) b!165930))

(assert (= (and d!57563 (not c!8614)) b!165931))

(assert (= (and d!57563 res!138207) b!165932))

(declare-fun m!263577 () Bool)

(assert (=> b!165930 m!263577))

(assert (=> b!165930 m!263037))

(declare-fun m!263579 () Bool)

(assert (=> b!165930 m!263579))

(assert (=> b!165931 m!263577))

(declare-fun m!263581 () Bool)

(assert (=> b!165931 m!263581))

(assert (=> b!165931 m!263037))

(declare-fun m!263583 () Bool)

(assert (=> b!165932 m!263583))

(declare-fun m!263585 () Bool)

(assert (=> b!165932 m!263585))

(assert (=> d!57351 d!57563))

(declare-fun d!57565 () Bool)

(declare-fun res!138208 () Bool)

(declare-fun e!114855 () Bool)

(assert (=> d!57565 (=> res!138208 e!114855)))

(assert (=> d!57565 (= res!138208 (= #b00000000000000000000000000000000 (currentByte!7897 thiss!1577)))))

(assert (=> d!57565 (= (arrayRangesEq!643 (buf!4215 thiss!1577) (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577))) #b00000000000000000000000000000000 (currentByte!7897 thiss!1577)) e!114855)))

(declare-fun b!165933 () Bool)

(declare-fun e!114856 () Bool)

(assert (=> b!165933 (= e!114855 e!114856)))

(declare-fun res!138209 () Bool)

(assert (=> b!165933 (=> (not res!138209) (not e!114856))))

(assert (=> b!165933 (= res!138209 (= (select (arr!4684 (buf!4215 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4684 (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!165934 () Bool)

(assert (=> b!165934 (= e!114856 (arrayRangesEq!643 (buf!4215 thiss!1577) (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (= (and d!57565 (not res!138208)) b!165933))

(assert (= (and b!165933 res!138209) b!165934))

(assert (=> b!165933 m!263259))

(declare-fun m!263587 () Bool)

(assert (=> b!165933 m!263587))

(declare-fun m!263589 () Bool)

(assert (=> b!165934 m!263589))

(assert (=> b!165690 d!57565))

(declare-fun d!57567 () Bool)

(declare-fun e!114857 () Bool)

(assert (=> d!57567 e!114857))

(declare-fun res!138210 () Bool)

(assert (=> d!57567 (=> (not res!138210) (not e!114857))))

(declare-fun lt!259394 () (_ BitVec 64))

(declare-fun lt!259390 () (_ BitVec 64))

(declare-fun lt!259391 () (_ BitVec 64))

(assert (=> d!57567 (= res!138210 (= lt!259390 (bvsub lt!259391 lt!259394)))))

(assert (=> d!57567 (or (= (bvand lt!259391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259394 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259391 lt!259394) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57567 (= lt!259394 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!259152)))) ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!259152))) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!259152)))))))

(declare-fun lt!259392 () (_ BitVec 64))

(declare-fun lt!259395 () (_ BitVec 64))

(assert (=> d!57567 (= lt!259391 (bvmul lt!259392 lt!259395))))

(assert (=> d!57567 (or (= lt!259392 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259395 (bvsdiv (bvmul lt!259392 lt!259395) lt!259392)))))

(assert (=> d!57567 (= lt!259395 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57567 (= lt!259392 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!259152)))))))

(assert (=> d!57567 (= lt!259390 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!259152))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!259152)))))))

(assert (=> d!57567 (invariant!0 (currentBit!7892 (_2!7879 lt!259152)) (currentByte!7897 (_2!7879 lt!259152)) (size!3763 (buf!4215 (_2!7879 lt!259152))))))

(assert (=> d!57567 (= (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!259152))) (currentByte!7897 (_2!7879 lt!259152)) (currentBit!7892 (_2!7879 lt!259152))) lt!259390)))

(declare-fun b!165935 () Bool)

(declare-fun res!138211 () Bool)

(assert (=> b!165935 (=> (not res!138211) (not e!114857))))

(assert (=> b!165935 (= res!138211 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259390))))

(declare-fun b!165936 () Bool)

(declare-fun lt!259393 () (_ BitVec 64))

(assert (=> b!165936 (= e!114857 (bvsle lt!259390 (bvmul lt!259393 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165936 (or (= lt!259393 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259393 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259393)))))

(assert (=> b!165936 (= lt!259393 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!259152)))))))

(assert (= (and d!57567 res!138210) b!165935))

(assert (= (and b!165935 res!138211) b!165936))

(declare-fun m!263591 () Bool)

(assert (=> d!57567 m!263591))

(declare-fun m!263593 () Bool)

(assert (=> d!57567 m!263593))

(assert (=> b!165704 d!57567))

(declare-fun d!57569 () Bool)

(declare-fun e!114858 () Bool)

(assert (=> d!57569 e!114858))

(declare-fun res!138212 () Bool)

(assert (=> d!57569 (=> (not res!138212) (not e!114858))))

(declare-fun lt!259396 () (_ BitVec 64))

(declare-fun lt!259400 () (_ BitVec 64))

(declare-fun lt!259397 () (_ BitVec 64))

(assert (=> d!57569 (= res!138212 (= lt!259396 (bvsub lt!259397 lt!259400)))))

(assert (=> d!57569 (or (= (bvand lt!259397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259397 lt!259400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57569 (= lt!259400 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))) ((_ sign_extend 32) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) ((_ sign_extend 32) (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))))

(declare-fun lt!259398 () (_ BitVec 64))

(declare-fun lt!259401 () (_ BitVec 64))

(assert (=> d!57569 (= lt!259397 (bvmul lt!259398 lt!259401))))

(assert (=> d!57569 (or (= lt!259398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259401 (bvsdiv (bvmul lt!259398 lt!259401) lt!259398)))))

(assert (=> d!57569 (= lt!259401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57569 (= lt!259398 ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))))

(assert (=> d!57569 (= lt!259396 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))))

(assert (=> d!57569 (invariant!0 (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))))

(assert (=> d!57569 (= (bitIndex!0 (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) lt!259396)))

(declare-fun b!165937 () Bool)

(declare-fun res!138213 () Bool)

(assert (=> b!165937 (=> (not res!138213) (not e!114858))))

(assert (=> b!165937 (= res!138213 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259396))))

(declare-fun b!165938 () Bool)

(declare-fun lt!259399 () (_ BitVec 64))

(assert (=> b!165938 (= e!114858 (bvsle lt!259396 (bvmul lt!259399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165938 (or (= lt!259399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259399)))))

(assert (=> b!165938 (= lt!259399 ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))))

(assert (= (and d!57569 res!138212) b!165937))

(assert (= (and b!165937 res!138213) b!165938))

(declare-fun m!263595 () Bool)

(assert (=> d!57569 m!263595))

(declare-fun m!263597 () Bool)

(assert (=> d!57569 m!263597))

(assert (=> b!165704 d!57569))

(declare-fun d!57571 () Bool)

(declare-fun e!114861 () Bool)

(assert (=> d!57571 e!114861))

(declare-fun res!138216 () Bool)

(assert (=> d!57571 (=> (not res!138216) (not e!114861))))

(declare-fun lt!259407 () (_ BitVec 64))

(declare-fun lt!259406 () BitStream!6682)

(assert (=> d!57571 (= res!138216 (= (bvadd lt!259407 (bvsub lt!258976 lt!258968)) (bitIndex!0 (size!3763 (buf!4215 lt!259406)) (currentByte!7897 lt!259406) (currentBit!7892 lt!259406))))))

(assert (=> d!57571 (or (not (= (bvand lt!259407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258976 lt!258968) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259407 (bvsub lt!258976 lt!258968)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57571 (= lt!259407 (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971))))))

(assert (=> d!57571 (= lt!259406 (_2!7879 (moveBitIndex!0 (_2!7880 lt!258971) (bvsub lt!258976 lt!258968))))))

(assert (=> d!57571 (moveBitIndexPrecond!0 (_2!7880 lt!258971) (bvsub lt!258976 lt!258968))))

(assert (=> d!57571 (= (withMovedBitIndex!0 (_2!7880 lt!258971) (bvsub lt!258976 lt!258968)) lt!259406)))

(declare-fun b!165941 () Bool)

(assert (=> b!165941 (= e!114861 (= (size!3763 (buf!4215 (_2!7880 lt!258971))) (size!3763 (buf!4215 lt!259406))))))

(assert (= (and d!57571 res!138216) b!165941))

(declare-fun m!263599 () Bool)

(assert (=> d!57571 m!263599))

(assert (=> d!57571 m!263535))

(declare-fun m!263601 () Bool)

(assert (=> d!57571 m!263601))

(declare-fun m!263603 () Bool)

(assert (=> d!57571 m!263603))

(assert (=> b!165626 d!57571))

(assert (=> b!165626 d!57365))

(assert (=> b!165626 d!57375))

(assert (=> b!165625 d!57375))

(declare-fun d!57573 () Bool)

(assert (=> d!57573 (arrayBitRangesEq!0 (buf!4215 (_2!7879 lt!258841)) (buf!4215 thiss!1577) lt!258967 lt!258972)))

(declare-fun lt!259410 () Unit!11516)

(declare-fun choose!8 (array!8430 array!8430 (_ BitVec 64) (_ BitVec 64)) Unit!11516)

(assert (=> d!57573 (= lt!259410 (choose!8 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) lt!258967 lt!258972))))

(assert (=> d!57573 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!258967) (bvsle lt!258967 lt!258972))))

(assert (=> d!57573 (= (arrayBitRangesEqSymmetric!0 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) lt!258967 lt!258972) lt!259410)))

(declare-fun bs!14283 () Bool)

(assert (= bs!14283 d!57573))

(assert (=> bs!14283 m!263171))

(declare-fun m!263605 () Bool)

(assert (=> bs!14283 m!263605))

(assert (=> b!165625 d!57573))

(declare-fun d!57575 () Bool)

(declare-fun res!138217 () Bool)

(declare-fun e!114863 () Bool)

(assert (=> d!57575 (=> res!138217 e!114863)))

(assert (=> d!57575 (= res!138217 (bvsge lt!258967 lt!258972))))

(assert (=> d!57575 (= (arrayBitRangesEq!0 (buf!4215 (_2!7879 lt!258841)) (buf!4215 thiss!1577) lt!258967 lt!258972) e!114863)))

(declare-fun b!165942 () Bool)

(declare-fun e!114866 () Bool)

(declare-fun e!114867 () Bool)

(assert (=> b!165942 (= e!114866 e!114867)))

(declare-fun c!8615 () Bool)

(declare-fun lt!259411 () tuple4!244)

(assert (=> b!165942 (= c!8615 (= (_3!595 lt!259411) (_4!122 lt!259411)))))

(declare-fun b!165943 () Bool)

(declare-fun call!2786 () Bool)

(assert (=> b!165943 (= e!114867 call!2786)))

(declare-fun e!114865 () Bool)

(declare-fun b!165944 () Bool)

(assert (=> b!165944 (= e!114865 (arrayRangesEq!643 (buf!4215 (_2!7879 lt!258841)) (buf!4215 thiss!1577) (_1!7895 lt!259411) (_2!7895 lt!259411)))))

(declare-fun b!165945 () Bool)

(declare-fun lt!259412 () (_ BitVec 32))

(declare-fun e!114864 () Bool)

(assert (=> b!165945 (= e!114864 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259411)) (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259411)) #b00000000000000000000000000000000 lt!259412))))

(declare-fun b!165946 () Bool)

(assert (=> b!165946 (= e!114863 e!114866)))

(declare-fun res!138219 () Bool)

(assert (=> b!165946 (=> (not res!138219) (not e!114866))))

(assert (=> b!165946 (= res!138219 e!114865)))

(declare-fun res!138220 () Bool)

(assert (=> b!165946 (=> res!138220 e!114865)))

(assert (=> b!165946 (= res!138220 (bvsge (_1!7895 lt!259411) (_2!7895 lt!259411)))))

(assert (=> b!165946 (= lt!259412 ((_ extract 31 0) (bvsrem lt!258972 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259413 () (_ BitVec 32))

(assert (=> b!165946 (= lt!259413 ((_ extract 31 0) (bvsrem lt!258967 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165946 (= lt!259411 (arrayBitIndices!0 lt!258967 lt!258972))))

(declare-fun b!165947 () Bool)

(declare-fun res!138221 () Bool)

(assert (=> b!165947 (= res!138221 (= lt!259412 #b00000000000000000000000000000000))))

(assert (=> b!165947 (=> res!138221 e!114864)))

(declare-fun e!114862 () Bool)

(assert (=> b!165947 (= e!114862 e!114864)))

(declare-fun b!165948 () Bool)

(assert (=> b!165948 (= e!114867 e!114862)))

(declare-fun res!138218 () Bool)

(assert (=> b!165948 (= res!138218 call!2786)))

(assert (=> b!165948 (=> (not res!138218) (not e!114862))))

(declare-fun bm!2783 () Bool)

(assert (=> bm!2783 (= call!2786 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259411)) (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259411)) lt!259413 (ite c!8615 lt!259412 #b00000000000000000000000000001000)))))

(assert (= (and d!57575 (not res!138217)) b!165946))

(assert (= (and b!165946 (not res!138220)) b!165944))

(assert (= (and b!165946 res!138219) b!165942))

(assert (= (and b!165942 c!8615) b!165943))

(assert (= (and b!165942 (not c!8615)) b!165948))

(assert (= (and b!165948 res!138218) b!165947))

(assert (= (and b!165947 (not res!138221)) b!165945))

(assert (= (or b!165943 b!165948) bm!2783))

(declare-fun m!263607 () Bool)

(assert (=> b!165944 m!263607))

(declare-fun m!263609 () Bool)

(assert (=> b!165945 m!263609))

(declare-fun m!263611 () Bool)

(assert (=> b!165945 m!263611))

(assert (=> b!165945 m!263609))

(assert (=> b!165945 m!263611))

(declare-fun m!263613 () Bool)

(assert (=> b!165945 m!263613))

(declare-fun m!263615 () Bool)

(assert (=> b!165946 m!263615))

(declare-fun m!263617 () Bool)

(assert (=> bm!2783 m!263617))

(declare-fun m!263619 () Bool)

(assert (=> bm!2783 m!263619))

(assert (=> bm!2783 m!263617))

(assert (=> bm!2783 m!263619))

(declare-fun m!263621 () Bool)

(assert (=> bm!2783 m!263621))

(assert (=> b!165625 d!57575))

(push 1)

(assert (not b!165878))

(assert (not d!57525))

(assert (not b!165899))

(assert (not d!57527))

(assert (not b!165917))

(assert (not d!57531))

(assert (not b!165887))

(assert (not b!165918))

(assert (not bm!2783))

(assert (not b!165896))

(assert (not d!57573))

(assert (not d!57539))

(assert (not b!165888))

(assert (not b!165894))

(assert (not d!57569))

(assert (not b!165946))

(assert (not b!165932))

(assert (not b!165897))

(assert (not b!165885))

(assert (not b!165884))

(assert (not b!165882))

(assert (not b!165881))

(assert (not d!57549))

(assert (not b!165934))

(assert (not b!165923))

(assert (not b!165876))

(assert (not b!165879))

(assert (not b!165916))

(assert (not b!165890))

(assert (not bm!2782))

(assert (not b!165930))

(assert (not b!165944))

(assert (not d!57567))

(assert (not b!165945))

(assert (not b!165921))

(assert (not d!57571))

(assert (not d!57523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57577 () Bool)

(declare-fun e!114868 () Bool)

(assert (=> d!57577 e!114868))

(declare-fun res!138222 () Bool)

(assert (=> d!57577 (=> (not res!138222) (not e!114868))))

(declare-fun lt!259418 () (_ BitVec 64))

(declare-fun lt!259414 () (_ BitVec 64))

(declare-fun lt!259415 () (_ BitVec 64))

(assert (=> d!57577 (= res!138222 (= lt!259414 (bvsub lt!259415 lt!259418)))))

(assert (=> d!57577 (or (= (bvand lt!259415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259418 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259415 lt!259418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57577 (= lt!259418 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 lt!258964))) ((_ sign_extend 32) (currentByte!7897 lt!258964)) ((_ sign_extend 32) (currentBit!7892 lt!258964))))))

(declare-fun lt!259416 () (_ BitVec 64))

(declare-fun lt!259419 () (_ BitVec 64))

(assert (=> d!57577 (= lt!259415 (bvmul lt!259416 lt!259419))))

(assert (=> d!57577 (or (= lt!259416 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259419 (bvsdiv (bvmul lt!259416 lt!259419) lt!259416)))))

(assert (=> d!57577 (= lt!259419 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57577 (= lt!259416 ((_ sign_extend 32) (size!3763 (buf!4215 lt!258964))))))

(assert (=> d!57577 (= lt!259414 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 lt!258964)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 lt!258964))))))

(assert (=> d!57577 (invariant!0 (currentBit!7892 lt!258964) (currentByte!7897 lt!258964) (size!3763 (buf!4215 lt!258964)))))

(assert (=> d!57577 (= (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964)) lt!259414)))

(declare-fun b!165949 () Bool)

(declare-fun res!138223 () Bool)

(assert (=> b!165949 (=> (not res!138223) (not e!114868))))

(assert (=> b!165949 (= res!138223 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259414))))

(declare-fun b!165950 () Bool)

(declare-fun lt!259417 () (_ BitVec 64))

(assert (=> b!165950 (= e!114868 (bvsle lt!259414 (bvmul lt!259417 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165950 (or (= lt!259417 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259417 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259417)))))

(assert (=> b!165950 (= lt!259417 ((_ sign_extend 32) (size!3763 (buf!4215 lt!258964))))))

(assert (= (and d!57577 res!138222) b!165949))

(assert (= (and b!165949 res!138223) b!165950))

(declare-fun m!263623 () Bool)

(assert (=> d!57577 m!263623))

(declare-fun m!263625 () Bool)

(assert (=> d!57577 m!263625))

(assert (=> b!165882 d!57577))

(declare-fun d!57579 () Bool)

(declare-fun res!138224 () Bool)

(declare-fun e!114870 () Bool)

(assert (=> d!57579 (=> res!138224 e!114870)))

(assert (=> d!57579 (= res!138224 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971)))))))

(assert (=> d!57579 (= (arrayBitRangesEq!0 (buf!4215 (_2!7880 lt!258971)) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971)))) e!114870)))

(declare-fun b!165951 () Bool)

(declare-fun e!114873 () Bool)

(declare-fun e!114874 () Bool)

(assert (=> b!165951 (= e!114873 e!114874)))

(declare-fun c!8616 () Bool)

(declare-fun lt!259420 () tuple4!244)

(assert (=> b!165951 (= c!8616 (= (_3!595 lt!259420) (_4!122 lt!259420)))))

(declare-fun b!165952 () Bool)

(declare-fun call!2787 () Bool)

(assert (=> b!165952 (= e!114874 call!2787)))

(declare-fun b!165953 () Bool)

(declare-fun e!114872 () Bool)

(assert (=> b!165953 (= e!114872 (arrayRangesEq!643 (buf!4215 (_2!7880 lt!258971)) (buf!4215 (_2!7879 lt!258841)) (_1!7895 lt!259420) (_2!7895 lt!259420)))))

(declare-fun lt!259421 () (_ BitVec 32))

(declare-fun b!165954 () Bool)

(declare-fun e!114871 () Bool)

(assert (=> b!165954 (= e!114871 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7880 lt!258971))) (_4!122 lt!259420)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259420)) #b00000000000000000000000000000000 lt!259421))))

(declare-fun b!165955 () Bool)

(assert (=> b!165955 (= e!114870 e!114873)))

(declare-fun res!138226 () Bool)

(assert (=> b!165955 (=> (not res!138226) (not e!114873))))

(assert (=> b!165955 (= res!138226 e!114872)))

(declare-fun res!138227 () Bool)

(assert (=> b!165955 (=> res!138227 e!114872)))

(assert (=> b!165955 (= res!138227 (bvsge (_1!7895 lt!259420) (_2!7895 lt!259420)))))

(assert (=> b!165955 (= lt!259421 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259422 () (_ BitVec 32))

(assert (=> b!165955 (= lt!259422 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165955 (= lt!259420 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971)))))))

(declare-fun b!165956 () Bool)

(declare-fun res!138228 () Bool)

(assert (=> b!165956 (= res!138228 (= lt!259421 #b00000000000000000000000000000000))))

(assert (=> b!165956 (=> res!138228 e!114871)))

(declare-fun e!114869 () Bool)

(assert (=> b!165956 (= e!114869 e!114871)))

(declare-fun b!165957 () Bool)

(assert (=> b!165957 (= e!114874 e!114869)))

(declare-fun res!138225 () Bool)

(assert (=> b!165957 (= res!138225 call!2787)))

(assert (=> b!165957 (=> (not res!138225) (not e!114869))))

(declare-fun bm!2784 () Bool)

(assert (=> bm!2784 (= call!2787 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7880 lt!258971))) (_3!595 lt!259420)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259420)) lt!259422 (ite c!8616 lt!259421 #b00000000000000000000000000001000)))))

(assert (= (and d!57579 (not res!138224)) b!165955))

(assert (= (and b!165955 (not res!138227)) b!165953))

(assert (= (and b!165955 res!138226) b!165951))

(assert (= (and b!165951 c!8616) b!165952))

(assert (= (and b!165951 (not c!8616)) b!165957))

(assert (= (and b!165957 res!138225) b!165956))

(assert (= (and b!165956 (not res!138228)) b!165954))

(assert (= (or b!165952 b!165957) bm!2784))

(declare-fun m!263627 () Bool)

(assert (=> b!165953 m!263627))

(declare-fun m!263629 () Bool)

(assert (=> b!165954 m!263629))

(declare-fun m!263631 () Bool)

(assert (=> b!165954 m!263631))

(assert (=> b!165954 m!263629))

(assert (=> b!165954 m!263631))

(declare-fun m!263633 () Bool)

(assert (=> b!165954 m!263633))

(assert (=> b!165955 m!263535))

(declare-fun m!263635 () Bool)

(assert (=> b!165955 m!263635))

(declare-fun m!263637 () Bool)

(assert (=> bm!2784 m!263637))

(declare-fun m!263639 () Bool)

(assert (=> bm!2784 m!263639))

(assert (=> bm!2784 m!263637))

(assert (=> bm!2784 m!263639))

(declare-fun m!263641 () Bool)

(assert (=> bm!2784 m!263641))

(assert (=> b!165899 d!57579))

(declare-fun d!57581 () Bool)

(declare-fun e!114875 () Bool)

(assert (=> d!57581 e!114875))

(declare-fun res!138229 () Bool)

(assert (=> d!57581 (=> (not res!138229) (not e!114875))))

(declare-fun lt!259427 () (_ BitVec 64))

(declare-fun lt!259423 () (_ BitVec 64))

(declare-fun lt!259424 () (_ BitVec 64))

(assert (=> d!57581 (= res!138229 (= lt!259423 (bvsub lt!259424 lt!259427)))))

(assert (=> d!57581 (or (= (bvand lt!259424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259427 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259424 lt!259427) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57581 (= lt!259427 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7880 lt!258971)))) ((_ sign_extend 32) (currentByte!7897 (_2!7880 lt!258971))) ((_ sign_extend 32) (currentBit!7892 (_2!7880 lt!258971)))))))

(declare-fun lt!259425 () (_ BitVec 64))

(declare-fun lt!259428 () (_ BitVec 64))

(assert (=> d!57581 (= lt!259424 (bvmul lt!259425 lt!259428))))

(assert (=> d!57581 (or (= lt!259425 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259428 (bvsdiv (bvmul lt!259425 lt!259428) lt!259425)))))

(assert (=> d!57581 (= lt!259428 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57581 (= lt!259425 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7880 lt!258971)))))))

(assert (=> d!57581 (= lt!259423 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_2!7880 lt!258971))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_2!7880 lt!258971)))))))

(assert (=> d!57581 (invariant!0 (currentBit!7892 (_2!7880 lt!258971)) (currentByte!7897 (_2!7880 lt!258971)) (size!3763 (buf!4215 (_2!7880 lt!258971))))))

(assert (=> d!57581 (= (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971))) lt!259423)))

(declare-fun b!165958 () Bool)

(declare-fun res!138230 () Bool)

(assert (=> b!165958 (=> (not res!138230) (not e!114875))))

(assert (=> b!165958 (= res!138230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259423))))

(declare-fun b!165959 () Bool)

(declare-fun lt!259426 () (_ BitVec 64))

(assert (=> b!165959 (= e!114875 (bvsle lt!259423 (bvmul lt!259426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165959 (or (= lt!259426 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259426 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259426)))))

(assert (=> b!165959 (= lt!259426 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7880 lt!258971)))))))

(assert (= (and d!57581 res!138229) b!165958))

(assert (= (and b!165958 res!138230) b!165959))

(declare-fun m!263643 () Bool)

(assert (=> d!57581 m!263643))

(declare-fun m!263645 () Bool)

(assert (=> d!57581 m!263645))

(assert (=> b!165899 d!57581))

(assert (=> b!165897 d!57581))

(assert (=> b!165897 d!57365))

(assert (=> d!57539 d!57541))

(declare-fun d!57583 () Bool)

(assert (=> d!57583 (isPrefixOf!0 lt!258964 (_2!7879 lt!258841))))

(assert (=> d!57583 true))

(declare-fun _$15!264 () Unit!11516)

(assert (=> d!57583 (= (choose!30 lt!258964 thiss!1577 (_2!7879 lt!258841)) _$15!264)))

(declare-fun bs!14284 () Bool)

(assert (= bs!14284 d!57583))

(assert (=> bs!14284 m!263183))

(assert (=> d!57539 d!57583))

(declare-fun d!57585 () Bool)

(declare-fun res!138233 () Bool)

(declare-fun e!114876 () Bool)

(assert (=> d!57585 (=> (not res!138233) (not e!114876))))

(assert (=> d!57585 (= res!138233 (= (size!3763 (buf!4215 lt!258964)) (size!3763 (buf!4215 thiss!1577))))))

(assert (=> d!57585 (= (isPrefixOf!0 lt!258964 thiss!1577) e!114876)))

(declare-fun b!165960 () Bool)

(declare-fun res!138231 () Bool)

(assert (=> b!165960 (=> (not res!138231) (not e!114876))))

(assert (=> b!165960 (= res!138231 (bvsle (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964)) (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(declare-fun b!165961 () Bool)

(declare-fun e!114877 () Bool)

(assert (=> b!165961 (= e!114876 e!114877)))

(declare-fun res!138232 () Bool)

(assert (=> b!165961 (=> res!138232 e!114877)))

(assert (=> b!165961 (= res!138232 (= (size!3763 (buf!4215 lt!258964)) #b00000000000000000000000000000000))))

(declare-fun b!165962 () Bool)

(assert (=> b!165962 (= e!114877 (arrayBitRangesEq!0 (buf!4215 lt!258964) (buf!4215 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(assert (= (and d!57585 res!138233) b!165960))

(assert (= (and b!165960 res!138231) b!165961))

(assert (= (and b!165961 (not res!138232)) b!165962))

(assert (=> b!165960 m!263539))

(assert (=> b!165960 m!263051))

(assert (=> b!165962 m!263539))

(assert (=> b!165962 m!263539))

(declare-fun m!263647 () Bool)

(assert (=> b!165962 m!263647))

(assert (=> d!57539 d!57585))

(declare-fun d!57587 () Bool)

(declare-fun res!138234 () Bool)

(declare-fun e!114879 () Bool)

(assert (=> d!57587 (=> res!138234 e!114879)))

(assert (=> d!57587 (= res!138234 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(assert (=> d!57587 (= (arrayBitRangesEq!0 (buf!4215 lt!258964) (buf!4215 lt!258964) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))) e!114879)))

(declare-fun b!165963 () Bool)

(declare-fun e!114882 () Bool)

(declare-fun e!114883 () Bool)

(assert (=> b!165963 (= e!114882 e!114883)))

(declare-fun c!8617 () Bool)

(declare-fun lt!259429 () tuple4!244)

(assert (=> b!165963 (= c!8617 (= (_3!595 lt!259429) (_4!122 lt!259429)))))

(declare-fun b!165964 () Bool)

(declare-fun call!2788 () Bool)

(assert (=> b!165964 (= e!114883 call!2788)))

(declare-fun b!165965 () Bool)

(declare-fun e!114881 () Bool)

(assert (=> b!165965 (= e!114881 (arrayRangesEq!643 (buf!4215 lt!258964) (buf!4215 lt!258964) (_1!7895 lt!259429) (_2!7895 lt!259429)))))

(declare-fun lt!259430 () (_ BitVec 32))

(declare-fun b!165966 () Bool)

(declare-fun e!114880 () Bool)

(assert (=> b!165966 (= e!114880 (byteRangesEq!0 (select (arr!4684 (buf!4215 lt!258964)) (_4!122 lt!259429)) (select (arr!4684 (buf!4215 lt!258964)) (_4!122 lt!259429)) #b00000000000000000000000000000000 lt!259430))))

(declare-fun b!165967 () Bool)

(assert (=> b!165967 (= e!114879 e!114882)))

(declare-fun res!138236 () Bool)

(assert (=> b!165967 (=> (not res!138236) (not e!114882))))

(assert (=> b!165967 (= res!138236 e!114881)))

(declare-fun res!138237 () Bool)

(assert (=> b!165967 (=> res!138237 e!114881)))

(assert (=> b!165967 (= res!138237 (bvsge (_1!7895 lt!259429) (_2!7895 lt!259429)))))

(assert (=> b!165967 (= lt!259430 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259431 () (_ BitVec 32))

(assert (=> b!165967 (= lt!259431 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165967 (= lt!259429 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(declare-fun b!165968 () Bool)

(declare-fun res!138238 () Bool)

(assert (=> b!165968 (= res!138238 (= lt!259430 #b00000000000000000000000000000000))))

(assert (=> b!165968 (=> res!138238 e!114880)))

(declare-fun e!114878 () Bool)

(assert (=> b!165968 (= e!114878 e!114880)))

(declare-fun b!165969 () Bool)

(assert (=> b!165969 (= e!114883 e!114878)))

(declare-fun res!138235 () Bool)

(assert (=> b!165969 (= res!138235 call!2788)))

(assert (=> b!165969 (=> (not res!138235) (not e!114878))))

(declare-fun bm!2785 () Bool)

(assert (=> bm!2785 (= call!2788 (byteRangesEq!0 (select (arr!4684 (buf!4215 lt!258964)) (_3!595 lt!259429)) (select (arr!4684 (buf!4215 lt!258964)) (_3!595 lt!259429)) lt!259431 (ite c!8617 lt!259430 #b00000000000000000000000000001000)))))

(assert (= (and d!57587 (not res!138234)) b!165967))

(assert (= (and b!165967 (not res!138237)) b!165965))

(assert (= (and b!165967 res!138236) b!165963))

(assert (= (and b!165963 c!8617) b!165964))

(assert (= (and b!165963 (not c!8617)) b!165969))

(assert (= (and b!165969 res!138235) b!165968))

(assert (= (and b!165968 (not res!138238)) b!165966))

(assert (= (or b!165964 b!165969) bm!2785))

(declare-fun m!263649 () Bool)

(assert (=> b!165965 m!263649))

(declare-fun m!263651 () Bool)

(assert (=> b!165966 m!263651))

(assert (=> b!165966 m!263651))

(assert (=> b!165966 m!263651))

(assert (=> b!165966 m!263651))

(declare-fun m!263653 () Bool)

(assert (=> b!165966 m!263653))

(assert (=> b!165967 m!263539))

(declare-fun m!263655 () Bool)

(assert (=> b!165967 m!263655))

(declare-fun m!263657 () Bool)

(assert (=> bm!2785 m!263657))

(assert (=> bm!2785 m!263657))

(assert (=> bm!2785 m!263657))

(assert (=> bm!2785 m!263657))

(declare-fun m!263659 () Bool)

(assert (=> bm!2785 m!263659))

(assert (=> b!165884 d!57587))

(assert (=> b!165884 d!57577))

(declare-fun d!57589 () Bool)

(declare-fun res!138239 () Bool)

(declare-fun e!114884 () Bool)

(assert (=> d!57589 (=> res!138239 e!114884)))

(assert (=> d!57589 (= res!138239 (= (_1!7895 lt!259411) (_2!7895 lt!259411)))))

(assert (=> d!57589 (= (arrayRangesEq!643 (buf!4215 (_2!7879 lt!258841)) (buf!4215 thiss!1577) (_1!7895 lt!259411) (_2!7895 lt!259411)) e!114884)))

(declare-fun b!165970 () Bool)

(declare-fun e!114885 () Bool)

(assert (=> b!165970 (= e!114884 e!114885)))

(declare-fun res!138240 () Bool)

(assert (=> b!165970 (=> (not res!138240) (not e!114885))))

(assert (=> b!165970 (= res!138240 (= (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_1!7895 lt!259411)) (select (arr!4684 (buf!4215 thiss!1577)) (_1!7895 lt!259411))))))

(declare-fun b!165971 () Bool)

(assert (=> b!165971 (= e!114885 (arrayRangesEq!643 (buf!4215 (_2!7879 lt!258841)) (buf!4215 thiss!1577) (bvadd (_1!7895 lt!259411) #b00000000000000000000000000000001) (_2!7895 lt!259411)))))

(assert (= (and d!57589 (not res!138239)) b!165970))

(assert (= (and b!165970 res!138240) b!165971))

(declare-fun m!263661 () Bool)

(assert (=> b!165970 m!263661))

(declare-fun m!263663 () Bool)

(assert (=> b!165970 m!263663))

(declare-fun m!263665 () Bool)

(assert (=> b!165971 m!263665))

(assert (=> b!165944 d!57589))

(assert (=> b!165876 d!57375))

(declare-fun d!57591 () Bool)

(declare-fun e!114886 () Bool)

(assert (=> d!57591 e!114886))

(declare-fun res!138241 () Bool)

(assert (=> d!57591 (=> (not res!138241) (not e!114886))))

(declare-fun lt!259436 () (_ BitVec 64))

(declare-fun lt!259432 () (_ BitVec 64))

(declare-fun lt!259433 () (_ BitVec 64))

(assert (=> d!57591 (= res!138241 (= lt!259432 (bvsub lt!259433 lt!259436)))))

(assert (=> d!57591 (or (= (bvand lt!259433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259436 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259433 lt!259436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57591 (= lt!259436 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_1!7880 lt!258971)))) ((_ sign_extend 32) (currentByte!7897 (_1!7880 lt!258971))) ((_ sign_extend 32) (currentBit!7892 (_1!7880 lt!258971)))))))

(declare-fun lt!259434 () (_ BitVec 64))

(declare-fun lt!259437 () (_ BitVec 64))

(assert (=> d!57591 (= lt!259433 (bvmul lt!259434 lt!259437))))

(assert (=> d!57591 (or (= lt!259434 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259437 (bvsdiv (bvmul lt!259434 lt!259437) lt!259434)))))

(assert (=> d!57591 (= lt!259437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57591 (= lt!259434 ((_ sign_extend 32) (size!3763 (buf!4215 (_1!7880 lt!258971)))))))

(assert (=> d!57591 (= lt!259432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_1!7880 lt!258971))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_1!7880 lt!258971)))))))

(assert (=> d!57591 (invariant!0 (currentBit!7892 (_1!7880 lt!258971)) (currentByte!7897 (_1!7880 lt!258971)) (size!3763 (buf!4215 (_1!7880 lt!258971))))))

(assert (=> d!57591 (= (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971))) lt!259432)))

(declare-fun b!165972 () Bool)

(declare-fun res!138242 () Bool)

(assert (=> b!165972 (=> (not res!138242) (not e!114886))))

(assert (=> b!165972 (= res!138242 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259432))))

(declare-fun b!165973 () Bool)

(declare-fun lt!259435 () (_ BitVec 64))

(assert (=> b!165973 (= e!114886 (bvsle lt!259432 (bvmul lt!259435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165973 (or (= lt!259435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259435)))))

(assert (=> b!165973 (= lt!259435 ((_ sign_extend 32) (size!3763 (buf!4215 (_1!7880 lt!258971)))))))

(assert (= (and d!57591 res!138241) b!165972))

(assert (= (and b!165972 res!138242) b!165973))

(declare-fun m!263667 () Bool)

(assert (=> d!57591 m!263667))

(declare-fun m!263669 () Bool)

(assert (=> d!57591 m!263669))

(assert (=> b!165921 d!57591))

(assert (=> b!165921 d!57375))

(assert (=> d!57525 d!57537))

(declare-fun d!57593 () Bool)

(assert (=> d!57593 (isPrefixOf!0 (_2!7879 lt!258841) (_2!7879 lt!258841))))

(assert (=> d!57593 true))

(declare-fun _$14!292 () Unit!11516)

(assert (=> d!57593 (= (choose!11 (_2!7879 lt!258841)) _$14!292)))

(declare-fun bs!14286 () Bool)

(assert (= bs!14286 d!57593))

(assert (=> bs!14286 m!263181))

(assert (=> d!57525 d!57593))

(declare-fun d!57595 () Bool)

(assert (=> d!57595 (= (arrayBitIndices!0 lt!258967 lt!258972) (tuple4!245 ((_ extract 31 0) (bvadd (bvsdiv lt!258967 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!258967 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!258972 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!258967 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!258972 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!165946 d!57595))

(assert (=> b!165879 d!57591))

(assert (=> b!165879 d!57581))

(declare-fun d!57597 () Bool)

(declare-fun res!138243 () Bool)

(declare-fun e!114887 () Bool)

(assert (=> d!57597 (=> res!138243 e!114887)))

(assert (=> d!57597 (= res!138243 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (=> d!57597 (= (arrayRangesEq!643 (buf!4215 thiss!1577) lt!258839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)) e!114887)))

(declare-fun b!165974 () Bool)

(declare-fun e!114888 () Bool)

(assert (=> b!165974 (= e!114887 e!114888)))

(declare-fun res!138244 () Bool)

(assert (=> b!165974 (=> (not res!138244) (not e!114888))))

(assert (=> b!165974 (= res!138244 (= (select (arr!4684 (buf!4215 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4684 lt!258839) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!165975 () Bool)

(assert (=> b!165975 (= e!114888 (arrayRangesEq!643 (buf!4215 thiss!1577) lt!258839 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (= (and d!57597 (not res!138243)) b!165974))

(assert (= (and b!165974 res!138244) b!165975))

(declare-fun m!263671 () Bool)

(assert (=> b!165974 m!263671))

(declare-fun m!263673 () Bool)

(assert (=> b!165974 m!263673))

(declare-fun m!263675 () Bool)

(assert (=> b!165975 m!263675))

(assert (=> b!165896 d!57597))

(declare-fun d!57599 () Bool)

(declare-fun res!138245 () Bool)

(declare-fun e!114890 () Bool)

(assert (=> d!57599 (=> res!138245 e!114890)))

(assert (=> d!57599 (= res!138245 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(assert (=> d!57599 (= (arrayBitRangesEq!0 (buf!4215 thiss!1577) (buf!4215 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) e!114890)))

(declare-fun b!165976 () Bool)

(declare-fun e!114893 () Bool)

(declare-fun e!114894 () Bool)

(assert (=> b!165976 (= e!114893 e!114894)))

(declare-fun c!8618 () Bool)

(declare-fun lt!259438 () tuple4!244)

(assert (=> b!165976 (= c!8618 (= (_3!595 lt!259438) (_4!122 lt!259438)))))

(declare-fun b!165977 () Bool)

(declare-fun call!2789 () Bool)

(assert (=> b!165977 (= e!114894 call!2789)))

(declare-fun b!165978 () Bool)

(declare-fun e!114892 () Bool)

(assert (=> b!165978 (= e!114892 (arrayRangesEq!643 (buf!4215 thiss!1577) (buf!4215 thiss!1577) (_1!7895 lt!259438) (_2!7895 lt!259438)))))

(declare-fun e!114891 () Bool)

(declare-fun b!165979 () Bool)

(declare-fun lt!259439 () (_ BitVec 32))

(assert (=> b!165979 (= e!114891 (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259438)) (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259438)) #b00000000000000000000000000000000 lt!259439))))

(declare-fun b!165980 () Bool)

(assert (=> b!165980 (= e!114890 e!114893)))

(declare-fun res!138247 () Bool)

(assert (=> b!165980 (=> (not res!138247) (not e!114893))))

(assert (=> b!165980 (= res!138247 e!114892)))

(declare-fun res!138248 () Bool)

(assert (=> b!165980 (=> res!138248 e!114892)))

(assert (=> b!165980 (= res!138248 (bvsge (_1!7895 lt!259438) (_2!7895 lt!259438)))))

(assert (=> b!165980 (= lt!259439 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259440 () (_ BitVec 32))

(assert (=> b!165980 (= lt!259440 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165980 (= lt!259438 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))))

(declare-fun b!165981 () Bool)

(declare-fun res!138249 () Bool)

(assert (=> b!165981 (= res!138249 (= lt!259439 #b00000000000000000000000000000000))))

(assert (=> b!165981 (=> res!138249 e!114891)))

(declare-fun e!114889 () Bool)

(assert (=> b!165981 (= e!114889 e!114891)))

(declare-fun b!165982 () Bool)

(assert (=> b!165982 (= e!114894 e!114889)))

(declare-fun res!138246 () Bool)

(assert (=> b!165982 (= res!138246 call!2789)))

(assert (=> b!165982 (=> (not res!138246) (not e!114889))))

(declare-fun bm!2786 () Bool)

(assert (=> bm!2786 (= call!2789 (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259438)) (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259438)) lt!259440 (ite c!8618 lt!259439 #b00000000000000000000000000001000)))))

(assert (= (and d!57599 (not res!138245)) b!165980))

(assert (= (and b!165980 (not res!138248)) b!165978))

(assert (= (and b!165980 res!138247) b!165976))

(assert (= (and b!165976 c!8618) b!165977))

(assert (= (and b!165976 (not c!8618)) b!165982))

(assert (= (and b!165982 res!138246) b!165981))

(assert (= (and b!165981 (not res!138249)) b!165979))

(assert (= (or b!165977 b!165982) bm!2786))

(declare-fun m!263677 () Bool)

(assert (=> b!165978 m!263677))

(declare-fun m!263679 () Bool)

(assert (=> b!165979 m!263679))

(assert (=> b!165979 m!263679))

(assert (=> b!165979 m!263679))

(assert (=> b!165979 m!263679))

(declare-fun m!263681 () Bool)

(assert (=> b!165979 m!263681))

(assert (=> b!165980 m!263051))

(assert (=> b!165980 m!263567))

(declare-fun m!263683 () Bool)

(assert (=> bm!2786 m!263683))

(assert (=> bm!2786 m!263683))

(assert (=> bm!2786 m!263683))

(assert (=> bm!2786 m!263683))

(declare-fun m!263685 () Bool)

(assert (=> bm!2786 m!263685))

(assert (=> b!165878 d!57599))

(assert (=> b!165878 d!57375))

(declare-fun d!57601 () Bool)

(declare-fun res!138250 () Bool)

(declare-fun e!114896 () Bool)

(assert (=> d!57601 (=> res!138250 e!114896)))

(assert (=> d!57601 (= res!138250 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))))))

(assert (=> d!57601 (= (arrayBitRangesEq!0 (buf!4215 (_1!7880 lt!258971)) (buf!4215 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))) e!114896)))

(declare-fun b!165983 () Bool)

(declare-fun e!114899 () Bool)

(declare-fun e!114900 () Bool)

(assert (=> b!165983 (= e!114899 e!114900)))

(declare-fun c!8619 () Bool)

(declare-fun lt!259441 () tuple4!244)

(assert (=> b!165983 (= c!8619 (= (_3!595 lt!259441) (_4!122 lt!259441)))))

(declare-fun b!165984 () Bool)

(declare-fun call!2790 () Bool)

(assert (=> b!165984 (= e!114900 call!2790)))

(declare-fun b!165985 () Bool)

(declare-fun e!114898 () Bool)

(assert (=> b!165985 (= e!114898 (arrayRangesEq!643 (buf!4215 (_1!7880 lt!258971)) (buf!4215 thiss!1577) (_1!7895 lt!259441) (_2!7895 lt!259441)))))

(declare-fun lt!259442 () (_ BitVec 32))

(declare-fun b!165986 () Bool)

(declare-fun e!114897 () Bool)

(assert (=> b!165986 (= e!114897 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_1!7880 lt!258971))) (_4!122 lt!259441)) (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259441)) #b00000000000000000000000000000000 lt!259442))))

(declare-fun b!165987 () Bool)

(assert (=> b!165987 (= e!114896 e!114899)))

(declare-fun res!138252 () Bool)

(assert (=> b!165987 (=> (not res!138252) (not e!114899))))

(assert (=> b!165987 (= res!138252 e!114898)))

(declare-fun res!138253 () Bool)

(assert (=> b!165987 (=> res!138253 e!114898)))

(assert (=> b!165987 (= res!138253 (bvsge (_1!7895 lt!259441) (_2!7895 lt!259441)))))

(assert (=> b!165987 (= lt!259442 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259443 () (_ BitVec 32))

(assert (=> b!165987 (= lt!259443 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165987 (= lt!259441 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))))))

(declare-fun b!165988 () Bool)

(declare-fun res!138254 () Bool)

(assert (=> b!165988 (= res!138254 (= lt!259442 #b00000000000000000000000000000000))))

(assert (=> b!165988 (=> res!138254 e!114897)))

(declare-fun e!114895 () Bool)

(assert (=> b!165988 (= e!114895 e!114897)))

(declare-fun b!165989 () Bool)

(assert (=> b!165989 (= e!114900 e!114895)))

(declare-fun res!138251 () Bool)

(assert (=> b!165989 (= res!138251 call!2790)))

(assert (=> b!165989 (=> (not res!138251) (not e!114895))))

(declare-fun bm!2787 () Bool)

(assert (=> bm!2787 (= call!2790 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_1!7880 lt!258971))) (_3!595 lt!259441)) (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259441)) lt!259443 (ite c!8619 lt!259442 #b00000000000000000000000000001000)))))

(assert (= (and d!57601 (not res!138250)) b!165987))

(assert (= (and b!165987 (not res!138253)) b!165985))

(assert (= (and b!165987 res!138252) b!165983))

(assert (= (and b!165983 c!8619) b!165984))

(assert (= (and b!165983 (not c!8619)) b!165989))

(assert (= (and b!165989 res!138251) b!165988))

(assert (= (and b!165988 (not res!138254)) b!165986))

(assert (= (or b!165984 b!165989) bm!2787))

(declare-fun m!263687 () Bool)

(assert (=> b!165985 m!263687))

(declare-fun m!263689 () Bool)

(assert (=> b!165986 m!263689))

(declare-fun m!263691 () Bool)

(assert (=> b!165986 m!263691))

(assert (=> b!165986 m!263689))

(assert (=> b!165986 m!263691))

(declare-fun m!263693 () Bool)

(assert (=> b!165986 m!263693))

(assert (=> b!165987 m!263533))

(declare-fun m!263695 () Bool)

(assert (=> b!165987 m!263695))

(declare-fun m!263697 () Bool)

(assert (=> bm!2787 m!263697))

(declare-fun m!263699 () Bool)

(assert (=> bm!2787 m!263699))

(assert (=> bm!2787 m!263697))

(assert (=> bm!2787 m!263699))

(declare-fun m!263701 () Bool)

(assert (=> bm!2787 m!263701))

(assert (=> b!165923 d!57601))

(assert (=> b!165923 d!57591))

(declare-fun d!57603 () Bool)

(assert (=> d!57603 (= (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259411)) (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259411)) #b00000000000000000000000000000000 lt!259412) (or (= #b00000000000000000000000000000000 lt!259412) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259411))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259412))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259411))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259412))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14287 () Bool)

(assert (= bs!14287 d!57603))

(declare-fun m!263703 () Bool)

(assert (=> bs!14287 m!263703))

(assert (=> bs!14287 m!263253))

(assert (=> b!165945 d!57603))

(assert (=> d!57531 d!57541))

(declare-fun d!57605 () Bool)

(assert (=> d!57605 (isPrefixOf!0 lt!258964 (_2!7879 lt!258841))))

(assert (=> d!57605 true))

(declare-fun _$15!265 () Unit!11516)

(assert (=> d!57605 (= (choose!30 lt!258964 (_2!7879 lt!258841) (_2!7879 lt!258841)) _$15!265)))

(declare-fun bs!14288 () Bool)

(assert (= bs!14288 d!57605))

(assert (=> bs!14288 m!263183))

(assert (=> d!57531 d!57605))

(declare-fun d!57607 () Bool)

(declare-fun res!138255 () Bool)

(declare-fun e!114902 () Bool)

(assert (=> d!57607 (=> res!138255 e!114902)))

(assert (=> d!57607 (= res!138255 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))))))

(assert (=> d!57607 (= (arrayBitRangesEq!0 (buf!4215 (_1!7880 lt!258971)) (buf!4215 (_2!7880 lt!258971)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))) e!114902)))

(declare-fun b!165990 () Bool)

(declare-fun e!114905 () Bool)

(declare-fun e!114906 () Bool)

(assert (=> b!165990 (= e!114905 e!114906)))

(declare-fun c!8620 () Bool)

(declare-fun lt!259444 () tuple4!244)

(assert (=> b!165990 (= c!8620 (= (_3!595 lt!259444) (_4!122 lt!259444)))))

(declare-fun b!165991 () Bool)

(declare-fun call!2791 () Bool)

(assert (=> b!165991 (= e!114906 call!2791)))

(declare-fun b!165992 () Bool)

(declare-fun e!114904 () Bool)

(assert (=> b!165992 (= e!114904 (arrayRangesEq!643 (buf!4215 (_1!7880 lt!258971)) (buf!4215 (_2!7880 lt!258971)) (_1!7895 lt!259444) (_2!7895 lt!259444)))))

(declare-fun e!114903 () Bool)

(declare-fun b!165993 () Bool)

(declare-fun lt!259445 () (_ BitVec 32))

(assert (=> b!165993 (= e!114903 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_1!7880 lt!258971))) (_4!122 lt!259444)) (select (arr!4684 (buf!4215 (_2!7880 lt!258971))) (_4!122 lt!259444)) #b00000000000000000000000000000000 lt!259445))))

(declare-fun b!165994 () Bool)

(assert (=> b!165994 (= e!114902 e!114905)))

(declare-fun res!138257 () Bool)

(assert (=> b!165994 (=> (not res!138257) (not e!114905))))

(assert (=> b!165994 (= res!138257 e!114904)))

(declare-fun res!138258 () Bool)

(assert (=> b!165994 (=> res!138258 e!114904)))

(assert (=> b!165994 (= res!138258 (bvsge (_1!7895 lt!259444) (_2!7895 lt!259444)))))

(assert (=> b!165994 (= lt!259445 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259446 () (_ BitVec 32))

(assert (=> b!165994 (= lt!259446 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165994 (= lt!259444 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258971))) (currentByte!7897 (_1!7880 lt!258971)) (currentBit!7892 (_1!7880 lt!258971)))))))

(declare-fun b!165995 () Bool)

(declare-fun res!138259 () Bool)

(assert (=> b!165995 (= res!138259 (= lt!259445 #b00000000000000000000000000000000))))

(assert (=> b!165995 (=> res!138259 e!114903)))

(declare-fun e!114901 () Bool)

(assert (=> b!165995 (= e!114901 e!114903)))

(declare-fun b!165996 () Bool)

(assert (=> b!165996 (= e!114906 e!114901)))

(declare-fun res!138256 () Bool)

(assert (=> b!165996 (= res!138256 call!2791)))

(assert (=> b!165996 (=> (not res!138256) (not e!114901))))

(declare-fun bm!2788 () Bool)

(assert (=> bm!2788 (= call!2791 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_1!7880 lt!258971))) (_3!595 lt!259444)) (select (arr!4684 (buf!4215 (_2!7880 lt!258971))) (_3!595 lt!259444)) lt!259446 (ite c!8620 lt!259445 #b00000000000000000000000000001000)))))

(assert (= (and d!57607 (not res!138255)) b!165994))

(assert (= (and b!165994 (not res!138258)) b!165992))

(assert (= (and b!165994 res!138257) b!165990))

(assert (= (and b!165990 c!8620) b!165991))

(assert (= (and b!165990 (not c!8620)) b!165996))

(assert (= (and b!165996 res!138256) b!165995))

(assert (= (and b!165995 (not res!138259)) b!165993))

(assert (= (or b!165991 b!165996) bm!2788))

(declare-fun m!263705 () Bool)

(assert (=> b!165992 m!263705))

(declare-fun m!263707 () Bool)

(assert (=> b!165993 m!263707))

(declare-fun m!263709 () Bool)

(assert (=> b!165993 m!263709))

(assert (=> b!165993 m!263707))

(assert (=> b!165993 m!263709))

(declare-fun m!263711 () Bool)

(assert (=> b!165993 m!263711))

(assert (=> b!165994 m!263533))

(assert (=> b!165994 m!263695))

(declare-fun m!263713 () Bool)

(assert (=> bm!2788 m!263713))

(declare-fun m!263715 () Bool)

(assert (=> bm!2788 m!263715))

(assert (=> bm!2788 m!263713))

(assert (=> bm!2788 m!263715))

(declare-fun m!263717 () Bool)

(assert (=> bm!2788 m!263717))

(assert (=> b!165881 d!57607))

(assert (=> b!165881 d!57591))

(declare-fun d!57609 () Bool)

(assert (=> d!57609 (= (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259411)) (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259411)) lt!259413 (ite c!8615 lt!259412 #b00000000000000000000000000001000)) (or (= lt!259413 (ite c!8615 lt!259412 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259411))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8615 lt!259412 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259413)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259411))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8615 lt!259412 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259413)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14289 () Bool)

(assert (= bs!14289 d!57609))

(declare-fun m!263719 () Bool)

(assert (=> bs!14289 m!263719))

(declare-fun m!263721 () Bool)

(assert (=> bs!14289 m!263721))

(assert (=> bm!2783 d!57609))

(declare-fun d!57611 () Bool)

(declare-fun e!114907 () Bool)

(assert (=> d!57611 e!114907))

(declare-fun res!138260 () Bool)

(assert (=> d!57611 (=> (not res!138260) (not e!114907))))

(declare-fun lt!259448 () (_ BitVec 64))

(declare-fun lt!259451 () (_ BitVec 64))

(declare-fun lt!259447 () (_ BitVec 64))

(assert (=> d!57611 (= res!138260 (= lt!259447 (bvsub lt!259448 lt!259451)))))

(assert (=> d!57611 (or (= (bvand lt!259448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259448 lt!259451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57611 (= lt!259451 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 lt!259406))) ((_ sign_extend 32) (currentByte!7897 lt!259406)) ((_ sign_extend 32) (currentBit!7892 lt!259406))))))

(declare-fun lt!259449 () (_ BitVec 64))

(declare-fun lt!259452 () (_ BitVec 64))

(assert (=> d!57611 (= lt!259448 (bvmul lt!259449 lt!259452))))

(assert (=> d!57611 (or (= lt!259449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259452 (bvsdiv (bvmul lt!259449 lt!259452) lt!259449)))))

(assert (=> d!57611 (= lt!259452 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57611 (= lt!259449 ((_ sign_extend 32) (size!3763 (buf!4215 lt!259406))))))

(assert (=> d!57611 (= lt!259447 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 lt!259406)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 lt!259406))))))

(assert (=> d!57611 (invariant!0 (currentBit!7892 lt!259406) (currentByte!7897 lt!259406) (size!3763 (buf!4215 lt!259406)))))

(assert (=> d!57611 (= (bitIndex!0 (size!3763 (buf!4215 lt!259406)) (currentByte!7897 lt!259406) (currentBit!7892 lt!259406)) lt!259447)))

(declare-fun b!165997 () Bool)

(declare-fun res!138261 () Bool)

(assert (=> b!165997 (=> (not res!138261) (not e!114907))))

(assert (=> b!165997 (= res!138261 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259447))))

(declare-fun b!165998 () Bool)

(declare-fun lt!259450 () (_ BitVec 64))

(assert (=> b!165998 (= e!114907 (bvsle lt!259447 (bvmul lt!259450 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165998 (or (= lt!259450 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259450 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259450)))))

(assert (=> b!165998 (= lt!259450 ((_ sign_extend 32) (size!3763 (buf!4215 lt!259406))))))

(assert (= (and d!57611 res!138260) b!165997))

(assert (= (and b!165997 res!138261) b!165998))

(declare-fun m!263723 () Bool)

(assert (=> d!57611 m!263723))

(declare-fun m!263725 () Bool)

(assert (=> d!57611 m!263725))

(assert (=> d!57571 d!57611))

(assert (=> d!57571 d!57581))

(declare-fun d!57613 () Bool)

(declare-fun lt!259454 () (_ BitVec 32))

(assert (=> d!57613 (= lt!259454 ((_ extract 31 0) (bvsrem (bvsub lt!258976 lt!258968) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259457 () (_ BitVec 32))

(assert (=> d!57613 (= lt!259457 ((_ extract 31 0) (bvsdiv (bvsub lt!258976 lt!258968) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114909 () Bool)

(assert (=> d!57613 e!114909))

(declare-fun res!138262 () Bool)

(assert (=> d!57613 (=> (not res!138262) (not e!114909))))

(assert (=> d!57613 (= res!138262 (moveBitIndexPrecond!0 (_2!7880 lt!258971) (bvsub lt!258976 lt!258968)))))

(declare-fun Unit!11546 () Unit!11516)

(declare-fun Unit!11547 () Unit!11516)

(declare-fun Unit!11548 () Unit!11516)

(assert (=> d!57613 (= (moveBitIndex!0 (_2!7880 lt!258971) (bvsub lt!258976 lt!258968)) (ite (bvslt (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259454) #b00000000000000000000000000000000) (tuple2!14577 Unit!11546 (BitStream!6683 (buf!4215 (_2!7880 lt!258971)) (bvsub (bvadd (currentByte!7897 (_2!7880 lt!258971)) lt!259457) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259454 (currentBit!7892 (_2!7880 lt!258971))))) (ite (bvsge (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259454) #b00000000000000000000000000001000) (tuple2!14577 Unit!11547 (BitStream!6683 (buf!4215 (_2!7880 lt!258971)) (bvadd (currentByte!7897 (_2!7880 lt!258971)) lt!259457 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259454) #b00000000000000000000000000001000))) (tuple2!14577 Unit!11548 (BitStream!6683 (buf!4215 (_2!7880 lt!258971)) (bvadd (currentByte!7897 (_2!7880 lt!258971)) lt!259457) (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259454))))))))

(declare-fun b!165999 () Bool)

(declare-fun e!114908 () Bool)

(assert (=> b!165999 (= e!114909 e!114908)))

(declare-fun res!138263 () Bool)

(assert (=> b!165999 (=> (not res!138263) (not e!114908))))

(declare-fun lt!259458 () tuple2!14576)

(declare-fun lt!259455 () (_ BitVec 64))

(assert (=> b!165999 (= res!138263 (= (bvadd lt!259455 (bvsub lt!258976 lt!258968)) (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!259458))) (currentByte!7897 (_2!7879 lt!259458)) (currentBit!7892 (_2!7879 lt!259458)))))))

(assert (=> b!165999 (or (not (= (bvand lt!259455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!258976 lt!258968) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259455 (bvsub lt!258976 lt!258968)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!165999 (= lt!259455 (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971))))))

(declare-fun lt!259456 () (_ BitVec 32))

(declare-fun lt!259453 () (_ BitVec 32))

(declare-fun Unit!11549 () Unit!11516)

(declare-fun Unit!11550 () Unit!11516)

(declare-fun Unit!11551 () Unit!11516)

(assert (=> b!165999 (= lt!259458 (ite (bvslt (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259456) #b00000000000000000000000000000000) (tuple2!14577 Unit!11549 (BitStream!6683 (buf!4215 (_2!7880 lt!258971)) (bvsub (bvadd (currentByte!7897 (_2!7880 lt!258971)) lt!259453) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259456 (currentBit!7892 (_2!7880 lt!258971))))) (ite (bvsge (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259456) #b00000000000000000000000000001000) (tuple2!14577 Unit!11550 (BitStream!6683 (buf!4215 (_2!7880 lt!258971)) (bvadd (currentByte!7897 (_2!7880 lt!258971)) lt!259453 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259456) #b00000000000000000000000000001000))) (tuple2!14577 Unit!11551 (BitStream!6683 (buf!4215 (_2!7880 lt!258971)) (bvadd (currentByte!7897 (_2!7880 lt!258971)) lt!259453) (bvadd (currentBit!7892 (_2!7880 lt!258971)) lt!259456))))))))

(assert (=> b!165999 (= lt!259456 ((_ extract 31 0) (bvsrem (bvsub lt!258976 lt!258968) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!165999 (= lt!259453 ((_ extract 31 0) (bvsdiv (bvsub lt!258976 lt!258968) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!166000 () Bool)

(assert (=> b!166000 (= e!114908 (and (= (size!3763 (buf!4215 (_2!7880 lt!258971))) (size!3763 (buf!4215 (_2!7879 lt!259458)))) (= (buf!4215 (_2!7880 lt!258971)) (buf!4215 (_2!7879 lt!259458)))))))

(assert (= (and d!57613 res!138262) b!165999))

(assert (= (and b!165999 res!138263) b!166000))

(assert (=> d!57613 m!263603))

(declare-fun m!263727 () Bool)

(assert (=> b!165999 m!263727))

(assert (=> b!165999 m!263535))

(assert (=> d!57571 d!57613))

(declare-fun d!57615 () Bool)

(declare-fun res!138264 () Bool)

(declare-fun e!114910 () Bool)

(assert (=> d!57615 (=> (not res!138264) (not e!114910))))

(assert (=> d!57615 (= res!138264 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7880 lt!258971))))) (bvsub lt!258976 lt!258968)) (bvsle (bvsub lt!258976 lt!258968) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7880 lt!258971))))))))))

(assert (=> d!57615 (= (moveBitIndexPrecond!0 (_2!7880 lt!258971) (bvsub lt!258976 lt!258968)) e!114910)))

(declare-fun b!166001 () Bool)

(declare-fun lt!259459 () (_ BitVec 64))

(assert (=> b!166001 (= e!114910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259459) (bvsle lt!259459 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7880 lt!258971))))))))))

(assert (=> b!166001 (= lt!259459 (bvadd (bitIndex!0 (size!3763 (buf!4215 (_2!7880 lt!258971))) (currentByte!7897 (_2!7880 lt!258971)) (currentBit!7892 (_2!7880 lt!258971))) (bvsub lt!258976 lt!258968)))))

(assert (= (and d!57615 res!138264) b!166001))

(assert (=> b!166001 m!263535))

(assert (=> d!57571 d!57615))

(assert (=> d!57527 d!57535))

(declare-fun d!57617 () Bool)

(assert (=> d!57617 (isPrefixOf!0 lt!258964 lt!258964)))

(assert (=> d!57617 true))

(declare-fun _$14!293 () Unit!11516)

(assert (=> d!57617 (= (choose!11 lt!258964) _$14!293)))

(declare-fun bs!14290 () Bool)

(assert (= bs!14290 d!57617))

(assert (=> bs!14290 m!263191))

(assert (=> d!57527 d!57617))

(declare-fun d!57619 () Bool)

(declare-fun lt!259461 () (_ BitVec 32))

(assert (=> d!57619 (= lt!259461 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259464 () (_ BitVec 32))

(assert (=> d!57619 (= lt!259464 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!114912 () Bool)

(assert (=> d!57619 e!114912))

(declare-fun res!138265 () Bool)

(assert (=> d!57619 (=> (not res!138265) (not e!114912))))

(assert (=> d!57619 (= res!138265 (moveBitIndexPrecond!0 (_1!7880 lt!258842) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11552 () Unit!11516)

(declare-fun Unit!11553 () Unit!11516)

(declare-fun Unit!11554 () Unit!11516)

(assert (=> d!57619 (= (moveBitIndex!0 (_1!7880 lt!258842) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259461) #b00000000000000000000000000000000) (tuple2!14577 Unit!11552 (BitStream!6683 (buf!4215 (_1!7880 lt!258842)) (bvsub (bvadd (currentByte!7897 (_1!7880 lt!258842)) lt!259464) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259461 (currentBit!7892 (_1!7880 lt!258842))))) (ite (bvsge (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259461) #b00000000000000000000000000001000) (tuple2!14577 Unit!11553 (BitStream!6683 (buf!4215 (_1!7880 lt!258842)) (bvadd (currentByte!7897 (_1!7880 lt!258842)) lt!259464 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259461) #b00000000000000000000000000001000))) (tuple2!14577 Unit!11554 (BitStream!6683 (buf!4215 (_1!7880 lt!258842)) (bvadd (currentByte!7897 (_1!7880 lt!258842)) lt!259464) (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259461))))))))

(declare-fun b!166002 () Bool)

(declare-fun e!114911 () Bool)

(assert (=> b!166002 (= e!114912 e!114911)))

(declare-fun res!138266 () Bool)

(assert (=> b!166002 (=> (not res!138266) (not e!114911))))

(declare-fun lt!259465 () tuple2!14576)

(declare-fun lt!259462 () (_ BitVec 64))

(assert (=> b!166002 (= res!138266 (= (bvadd lt!259462 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!259465))) (currentByte!7897 (_2!7879 lt!259465)) (currentBit!7892 (_2!7879 lt!259465)))))))

(assert (=> b!166002 (or (not (= (bvand lt!259462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!259462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!259462 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!166002 (= lt!259462 (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258842))) (currentByte!7897 (_1!7880 lt!258842)) (currentBit!7892 (_1!7880 lt!258842))))))

(declare-fun lt!259460 () (_ BitVec 32))

(declare-fun lt!259463 () (_ BitVec 32))

(declare-fun Unit!11555 () Unit!11516)

(declare-fun Unit!11556 () Unit!11516)

(declare-fun Unit!11557 () Unit!11516)

(assert (=> b!166002 (= lt!259465 (ite (bvslt (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259463) #b00000000000000000000000000000000) (tuple2!14577 Unit!11555 (BitStream!6683 (buf!4215 (_1!7880 lt!258842)) (bvsub (bvadd (currentByte!7897 (_1!7880 lt!258842)) lt!259460) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!259463 (currentBit!7892 (_1!7880 lt!258842))))) (ite (bvsge (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259463) #b00000000000000000000000000001000) (tuple2!14577 Unit!11556 (BitStream!6683 (buf!4215 (_1!7880 lt!258842)) (bvadd (currentByte!7897 (_1!7880 lt!258842)) lt!259460 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259463) #b00000000000000000000000000001000))) (tuple2!14577 Unit!11557 (BitStream!6683 (buf!4215 (_1!7880 lt!258842)) (bvadd (currentByte!7897 (_1!7880 lt!258842)) lt!259460) (bvadd (currentBit!7892 (_1!7880 lt!258842)) lt!259463))))))))

(assert (=> b!166002 (= lt!259463 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166002 (= lt!259460 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!166003 () Bool)

(assert (=> b!166003 (= e!114911 (and (= (size!3763 (buf!4215 (_1!7880 lt!258842))) (size!3763 (buf!4215 (_2!7879 lt!259465)))) (= (buf!4215 (_1!7880 lt!258842)) (buf!4215 (_2!7879 lt!259465)))))))

(assert (= (and d!57619 res!138265) b!166002))

(assert (= (and b!166002 res!138266) b!166003))

(declare-fun m!263729 () Bool)

(assert (=> d!57619 m!263729))

(declare-fun m!263731 () Bool)

(assert (=> b!166002 m!263731))

(assert (=> b!166002 m!263585))

(assert (=> b!165930 d!57619))

(declare-fun d!57621 () Bool)

(declare-fun res!138267 () Bool)

(declare-fun e!114913 () Bool)

(assert (=> d!57621 (=> res!138267 e!114913)))

(assert (=> d!57621 (= res!138267 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (=> d!57621 (= (arrayRangesEq!643 (buf!4215 thiss!1577) (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)) e!114913)))

(declare-fun b!166004 () Bool)

(declare-fun e!114914 () Bool)

(assert (=> b!166004 (= e!114913 e!114914)))

(declare-fun res!138268 () Bool)

(assert (=> b!166004 (=> (not res!138268) (not e!114914))))

(assert (=> b!166004 (= res!138268 (= (select (arr!4684 (buf!4215 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4684 (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!166005 () Bool)

(assert (=> b!166005 (= e!114914 (arrayRangesEq!643 (buf!4215 thiss!1577) (array!8431 (store (arr!4684 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) lt!258836) (size!3763 (buf!4215 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!7897 thiss!1577)))))

(assert (= (and d!57621 (not res!138267)) b!166004))

(assert (= (and b!166004 res!138268) b!166005))

(assert (=> b!166004 m!263551))

(declare-fun m!263733 () Bool)

(assert (=> b!166004 m!263733))

(declare-fun m!263735 () Bool)

(assert (=> b!166005 m!263735))

(assert (=> b!165934 d!57621))

(assert (=> d!57573 d!57575))

(declare-fun d!57623 () Bool)

(assert (=> d!57623 (arrayBitRangesEq!0 (buf!4215 (_2!7879 lt!258841)) (buf!4215 thiss!1577) lt!258967 lt!258972)))

(assert (=> d!57623 true))

(declare-fun _$19!135 () Unit!11516)

(assert (=> d!57623 (= (choose!8 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) lt!258967 lt!258972) _$19!135)))

(declare-fun bs!14291 () Bool)

(assert (= bs!14291 d!57623))

(assert (=> bs!14291 m!263171))

(assert (=> d!57573 d!57623))

(assert (=> b!165888 d!57577))

(assert (=> b!165888 d!57365))

(declare-fun d!57625 () Bool)

(declare-fun e!114915 () Bool)

(assert (=> d!57625 e!114915))

(declare-fun res!138269 () Bool)

(assert (=> d!57625 (=> (not res!138269) (not e!114915))))

(declare-fun lt!259466 () (_ BitVec 64))

(declare-fun lt!259470 () (_ BitVec 64))

(declare-fun lt!259467 () (_ BitVec 64))

(assert (=> d!57625 (= res!138269 (= lt!259466 (bvsub lt!259467 lt!259470)))))

(assert (=> d!57625 (or (= (bvand lt!259467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259470 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259467 lt!259470) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57625 (= lt!259470 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7889 lt!259384)))) ((_ sign_extend 32) (currentByte!7897 (_2!7889 lt!259384))) ((_ sign_extend 32) (currentBit!7892 (_2!7889 lt!259384)))))))

(declare-fun lt!259468 () (_ BitVec 64))

(declare-fun lt!259471 () (_ BitVec 64))

(assert (=> d!57625 (= lt!259467 (bvmul lt!259468 lt!259471))))

(assert (=> d!57625 (or (= lt!259468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259471 (bvsdiv (bvmul lt!259468 lt!259471) lt!259468)))))

(assert (=> d!57625 (= lt!259471 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57625 (= lt!259468 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7889 lt!259384)))))))

(assert (=> d!57625 (= lt!259466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_2!7889 lt!259384))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_2!7889 lt!259384)))))))

(assert (=> d!57625 (invariant!0 (currentBit!7892 (_2!7889 lt!259384)) (currentByte!7897 (_2!7889 lt!259384)) (size!3763 (buf!4215 (_2!7889 lt!259384))))))

(assert (=> d!57625 (= (bitIndex!0 (size!3763 (buf!4215 (_2!7889 lt!259384))) (currentByte!7897 (_2!7889 lt!259384)) (currentBit!7892 (_2!7889 lt!259384))) lt!259466)))

(declare-fun b!166006 () Bool)

(declare-fun res!138270 () Bool)

(assert (=> b!166006 (=> (not res!138270) (not e!114915))))

(assert (=> b!166006 (= res!138270 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259466))))

(declare-fun b!166007 () Bool)

(declare-fun lt!259469 () (_ BitVec 64))

(assert (=> b!166007 (= e!114915 (bvsle lt!259466 (bvmul lt!259469 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166007 (or (= lt!259469 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259469 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259469)))))

(assert (=> b!166007 (= lt!259469 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7889 lt!259384)))))))

(assert (= (and d!57625 res!138269) b!166006))

(assert (= (and b!166006 res!138270) b!166007))

(declare-fun m!263737 () Bool)

(assert (=> d!57625 m!263737))

(declare-fun m!263739 () Bool)

(assert (=> d!57625 m!263739))

(assert (=> b!165932 d!57625))

(declare-fun d!57627 () Bool)

(declare-fun e!114916 () Bool)

(assert (=> d!57627 e!114916))

(declare-fun res!138271 () Bool)

(assert (=> d!57627 (=> (not res!138271) (not e!114916))))

(declare-fun lt!259473 () (_ BitVec 64))

(declare-fun lt!259472 () (_ BitVec 64))

(declare-fun lt!259476 () (_ BitVec 64))

(assert (=> d!57627 (= res!138271 (= lt!259472 (bvsub lt!259473 lt!259476)))))

(assert (=> d!57627 (or (= (bvand lt!259473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!259476 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!259473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!259473 lt!259476) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57627 (= lt!259476 (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_1!7880 lt!258842)))) ((_ sign_extend 32) (currentByte!7897 (_1!7880 lt!258842))) ((_ sign_extend 32) (currentBit!7892 (_1!7880 lt!258842)))))))

(declare-fun lt!259474 () (_ BitVec 64))

(declare-fun lt!259477 () (_ BitVec 64))

(assert (=> d!57627 (= lt!259473 (bvmul lt!259474 lt!259477))))

(assert (=> d!57627 (or (= lt!259474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!259477 (bvsdiv (bvmul lt!259474 lt!259477) lt!259474)))))

(assert (=> d!57627 (= lt!259477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!57627 (= lt!259474 ((_ sign_extend 32) (size!3763 (buf!4215 (_1!7880 lt!258842)))))))

(assert (=> d!57627 (= lt!259472 (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_1!7880 lt!258842))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_1!7880 lt!258842)))))))

(assert (=> d!57627 (invariant!0 (currentBit!7892 (_1!7880 lt!258842)) (currentByte!7897 (_1!7880 lt!258842)) (size!3763 (buf!4215 (_1!7880 lt!258842))))))

(assert (=> d!57627 (= (bitIndex!0 (size!3763 (buf!4215 (_1!7880 lt!258842))) (currentByte!7897 (_1!7880 lt!258842)) (currentBit!7892 (_1!7880 lt!258842))) lt!259472)))

(declare-fun b!166008 () Bool)

(declare-fun res!138272 () Bool)

(assert (=> b!166008 (=> (not res!138272) (not e!114916))))

(assert (=> b!166008 (= res!138272 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!259472))))

(declare-fun b!166009 () Bool)

(declare-fun lt!259475 () (_ BitVec 64))

(assert (=> b!166009 (= e!114916 (bvsle lt!259472 (bvmul lt!259475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166009 (or (= lt!259475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!259475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!259475)))))

(assert (=> b!166009 (= lt!259475 ((_ sign_extend 32) (size!3763 (buf!4215 (_1!7880 lt!258842)))))))

(assert (= (and d!57627 res!138271) b!166008))

(assert (= (and b!166008 res!138272) b!166009))

(declare-fun m!263741 () Bool)

(assert (=> d!57627 m!263741))

(declare-fun m!263743 () Bool)

(assert (=> d!57627 m!263743))

(assert (=> b!165932 d!57627))

(declare-fun d!57629 () Bool)

(declare-fun res!138273 () Bool)

(declare-fun e!114917 () Bool)

(assert (=> d!57629 (=> res!138273 e!114917)))

(assert (=> d!57629 (= res!138273 (= (_1!7895 lt!259366) (_2!7895 lt!259366)))))

(assert (=> d!57629 (= (arrayRangesEq!643 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) (_1!7895 lt!259366) (_2!7895 lt!259366)) e!114917)))

(declare-fun b!166010 () Bool)

(declare-fun e!114918 () Bool)

(assert (=> b!166010 (= e!114917 e!114918)))

(declare-fun res!138274 () Bool)

(assert (=> b!166010 (=> (not res!138274) (not e!114918))))

(assert (=> b!166010 (= res!138274 (= (select (arr!4684 (buf!4215 thiss!1577)) (_1!7895 lt!259366)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_1!7895 lt!259366))))))

(declare-fun b!166011 () Bool)

(assert (=> b!166011 (= e!114918 (arrayRangesEq!643 (buf!4215 thiss!1577) (buf!4215 (_2!7879 lt!258841)) (bvadd (_1!7895 lt!259366) #b00000000000000000000000000000001) (_2!7895 lt!259366)))))

(assert (= (and d!57629 (not res!138273)) b!166010))

(assert (= (and b!166010 res!138274) b!166011))

(declare-fun m!263745 () Bool)

(assert (=> b!166010 m!263745))

(declare-fun m!263747 () Bool)

(assert (=> b!166010 m!263747))

(declare-fun m!263749 () Bool)

(assert (=> b!166011 m!263749))

(assert (=> b!165916 d!57629))

(assert (=> d!57549 d!57565))

(declare-fun d!57631 () Bool)

(assert (=> d!57631 (= (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))) ((_ sign_extend 32) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) ((_ sign_extend 32) (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))) (bvsub (bvmul ((_ sign_extend 32) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))))))

(assert (=> d!57569 d!57631))

(declare-fun d!57633 () Bool)

(assert (=> d!57633 (= (invariant!0 (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))) (and (bvsge (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) #b00000000000000000000000000000000) (bvslt (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) #b00000000000000000000000000001000) (bvsge (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) #b00000000000000000000000000000000) (or (bvslt (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))))) (and (= (currentBit!7892 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) #b00000000000000000000000000000000) (= (currentByte!7897 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (size!3763 (buf!4215 (BitStream!6683 lt!258839 (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)))))))))))

(assert (=> d!57569 d!57633))

(declare-fun d!57635 () Bool)

(assert (=> d!57635 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577))) (tuple4!245 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3763 (buf!4215 thiss!1577)) (currentByte!7897 thiss!1577) (currentBit!7892 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!165918 d!57635))

(assert (=> d!57523 d!57529))

(declare-fun d!57637 () Bool)

(assert (=> d!57637 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!57637 true))

(declare-fun _$14!294 () Unit!11516)

(assert (=> d!57637 (= (choose!11 thiss!1577) _$14!294)))

(declare-fun bs!14292 () Bool)

(assert (= bs!14292 d!57637))

(assert (=> bs!14292 m!263179))

(assert (=> d!57523 d!57637))

(declare-fun d!57639 () Bool)

(assert (=> d!57639 (= (remainingBits!0 ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!259152)))) ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!259152))) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!259152)))) (bvsub (bvmul ((_ sign_extend 32) (size!3763 (buf!4215 (_2!7879 lt!259152)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7897 (_2!7879 lt!259152))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7892 (_2!7879 lt!259152))))))))

(assert (=> d!57567 d!57639))

(declare-fun d!57641 () Bool)

(assert (=> d!57641 (= (invariant!0 (currentBit!7892 (_2!7879 lt!259152)) (currentByte!7897 (_2!7879 lt!259152)) (size!3763 (buf!4215 (_2!7879 lt!259152)))) (and (bvsge (currentBit!7892 (_2!7879 lt!259152)) #b00000000000000000000000000000000) (bvslt (currentBit!7892 (_2!7879 lt!259152)) #b00000000000000000000000000001000) (bvsge (currentByte!7897 (_2!7879 lt!259152)) #b00000000000000000000000000000000) (or (bvslt (currentByte!7897 (_2!7879 lt!259152)) (size!3763 (buf!4215 (_2!7879 lt!259152)))) (and (= (currentBit!7892 (_2!7879 lt!259152)) #b00000000000000000000000000000000) (= (currentByte!7897 (_2!7879 lt!259152)) (size!3763 (buf!4215 (_2!7879 lt!259152))))))))))

(assert (=> d!57567 d!57641))

(declare-fun d!57643 () Bool)

(declare-fun res!138275 () Bool)

(declare-fun e!114920 () Bool)

(assert (=> d!57643 (=> res!138275 e!114920)))

(assert (=> d!57643 (= res!138275 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))))))

(assert (=> d!57643 (= (arrayBitRangesEq!0 (buf!4215 (_2!7879 lt!258841)) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))) e!114920)))

(declare-fun b!166012 () Bool)

(declare-fun e!114923 () Bool)

(declare-fun e!114924 () Bool)

(assert (=> b!166012 (= e!114923 e!114924)))

(declare-fun c!8621 () Bool)

(declare-fun lt!259478 () tuple4!244)

(assert (=> b!166012 (= c!8621 (= (_3!595 lt!259478) (_4!122 lt!259478)))))

(declare-fun b!166013 () Bool)

(declare-fun call!2792 () Bool)

(assert (=> b!166013 (= e!114924 call!2792)))

(declare-fun b!166014 () Bool)

(declare-fun e!114922 () Bool)

(assert (=> b!166014 (= e!114922 (arrayRangesEq!643 (buf!4215 (_2!7879 lt!258841)) (buf!4215 (_2!7879 lt!258841)) (_1!7895 lt!259478) (_2!7895 lt!259478)))))

(declare-fun b!166015 () Bool)

(declare-fun lt!259479 () (_ BitVec 32))

(declare-fun e!114921 () Bool)

(assert (=> b!166015 (= e!114921 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259478)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259478)) #b00000000000000000000000000000000 lt!259479))))

(declare-fun b!166016 () Bool)

(assert (=> b!166016 (= e!114920 e!114923)))

(declare-fun res!138277 () Bool)

(assert (=> b!166016 (=> (not res!138277) (not e!114923))))

(assert (=> b!166016 (= res!138277 e!114922)))

(declare-fun res!138278 () Bool)

(assert (=> b!166016 (=> res!138278 e!114922)))

(assert (=> b!166016 (= res!138278 (bvsge (_1!7895 lt!259478) (_2!7895 lt!259478)))))

(assert (=> b!166016 (= lt!259479 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259480 () (_ BitVec 32))

(assert (=> b!166016 (= lt!259480 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166016 (= lt!259478 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 (_2!7879 lt!258841))) (currentByte!7897 (_2!7879 lt!258841)) (currentBit!7892 (_2!7879 lt!258841)))))))

(declare-fun b!166017 () Bool)

(declare-fun res!138279 () Bool)

(assert (=> b!166017 (= res!138279 (= lt!259479 #b00000000000000000000000000000000))))

(assert (=> b!166017 (=> res!138279 e!114921)))

(declare-fun e!114919 () Bool)

(assert (=> b!166017 (= e!114919 e!114921)))

(declare-fun b!166018 () Bool)

(assert (=> b!166018 (= e!114924 e!114919)))

(declare-fun res!138276 () Bool)

(assert (=> b!166018 (= res!138276 call!2792)))

(assert (=> b!166018 (=> (not res!138276) (not e!114919))))

(declare-fun bm!2789 () Bool)

(assert (=> bm!2789 (= call!2792 (byteRangesEq!0 (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259478)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259478)) lt!259480 (ite c!8621 lt!259479 #b00000000000000000000000000001000)))))

(assert (= (and d!57643 (not res!138275)) b!166016))

(assert (= (and b!166016 (not res!138278)) b!166014))

(assert (= (and b!166016 res!138277) b!166012))

(assert (= (and b!166012 c!8621) b!166013))

(assert (= (and b!166012 (not c!8621)) b!166018))

(assert (= (and b!166018 res!138276) b!166017))

(assert (= (and b!166017 (not res!138279)) b!166015))

(assert (= (or b!166013 b!166018) bm!2789))

(declare-fun m!263751 () Bool)

(assert (=> b!166014 m!263751))

(declare-fun m!263753 () Bool)

(assert (=> b!166015 m!263753))

(assert (=> b!166015 m!263753))

(assert (=> b!166015 m!263753))

(assert (=> b!166015 m!263753))

(declare-fun m!263755 () Bool)

(assert (=> b!166015 m!263755))

(assert (=> b!166016 m!263049))

(declare-fun m!263757 () Bool)

(assert (=> b!166016 m!263757))

(declare-fun m!263759 () Bool)

(assert (=> bm!2789 m!263759))

(assert (=> bm!2789 m!263759))

(assert (=> bm!2789 m!263759))

(assert (=> bm!2789 m!263759))

(declare-fun m!263761 () Bool)

(assert (=> bm!2789 m!263761))

(assert (=> b!165887 d!57643))

(assert (=> b!165887 d!57365))

(assert (=> b!165885 d!57365))

(declare-fun d!57645 () Bool)

(assert (=> d!57645 (= (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259366)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259366)) #b00000000000000000000000000000000 lt!259367) (or (= #b00000000000000000000000000000000 lt!259367) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 thiss!1577)) (_4!122 lt!259366))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259367))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259366))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!259367))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14293 () Bool)

(assert (= bs!14293 d!57645))

(declare-fun m!263763 () Bool)

(assert (=> bs!14293 m!263763))

(assert (=> bs!14293 m!263253))

(assert (=> b!165917 d!57645))

(declare-fun d!57647 () Bool)

(declare-fun res!138280 () Bool)

(declare-fun e!114926 () Bool)

(assert (=> d!57647 (=> res!138280 e!114926)))

(assert (=> d!57647 (= res!138280 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(assert (=> d!57647 (= (arrayBitRangesEq!0 (buf!4215 lt!258964) (buf!4215 (_2!7879 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))) e!114926)))

(declare-fun b!166019 () Bool)

(declare-fun e!114929 () Bool)

(declare-fun e!114930 () Bool)

(assert (=> b!166019 (= e!114929 e!114930)))

(declare-fun c!8622 () Bool)

(declare-fun lt!259481 () tuple4!244)

(assert (=> b!166019 (= c!8622 (= (_3!595 lt!259481) (_4!122 lt!259481)))))

(declare-fun b!166020 () Bool)

(declare-fun call!2793 () Bool)

(assert (=> b!166020 (= e!114930 call!2793)))

(declare-fun b!166021 () Bool)

(declare-fun e!114928 () Bool)

(assert (=> b!166021 (= e!114928 (arrayRangesEq!643 (buf!4215 lt!258964) (buf!4215 (_2!7879 lt!258841)) (_1!7895 lt!259481) (_2!7895 lt!259481)))))

(declare-fun b!166022 () Bool)

(declare-fun e!114927 () Bool)

(declare-fun lt!259482 () (_ BitVec 32))

(assert (=> b!166022 (= e!114927 (byteRangesEq!0 (select (arr!4684 (buf!4215 lt!258964)) (_4!122 lt!259481)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_4!122 lt!259481)) #b00000000000000000000000000000000 lt!259482))))

(declare-fun b!166023 () Bool)

(assert (=> b!166023 (= e!114926 e!114929)))

(declare-fun res!138282 () Bool)

(assert (=> b!166023 (=> (not res!138282) (not e!114929))))

(assert (=> b!166023 (= res!138282 e!114928)))

(declare-fun res!138283 () Bool)

(assert (=> b!166023 (=> res!138283 e!114928)))

(assert (=> b!166023 (= res!138283 (bvsge (_1!7895 lt!259481) (_2!7895 lt!259481)))))

(assert (=> b!166023 (= lt!259482 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!259483 () (_ BitVec 32))

(assert (=> b!166023 (= lt!259483 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!166023 (= lt!259481 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3763 (buf!4215 lt!258964)) (currentByte!7897 lt!258964) (currentBit!7892 lt!258964))))))

(declare-fun b!166024 () Bool)

(declare-fun res!138284 () Bool)

(assert (=> b!166024 (= res!138284 (= lt!259482 #b00000000000000000000000000000000))))

(assert (=> b!166024 (=> res!138284 e!114927)))

(declare-fun e!114925 () Bool)

(assert (=> b!166024 (= e!114925 e!114927)))

(declare-fun b!166025 () Bool)

(assert (=> b!166025 (= e!114930 e!114925)))

(declare-fun res!138281 () Bool)

(assert (=> b!166025 (= res!138281 call!2793)))

(assert (=> b!166025 (=> (not res!138281) (not e!114925))))

(declare-fun bm!2790 () Bool)

(assert (=> bm!2790 (= call!2793 (byteRangesEq!0 (select (arr!4684 (buf!4215 lt!258964)) (_3!595 lt!259481)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259481)) lt!259483 (ite c!8622 lt!259482 #b00000000000000000000000000001000)))))

(assert (= (and d!57647 (not res!138280)) b!166023))

(assert (= (and b!166023 (not res!138283)) b!166021))

(assert (= (and b!166023 res!138282) b!166019))

(assert (= (and b!166019 c!8622) b!166020))

(assert (= (and b!166019 (not c!8622)) b!166025))

(assert (= (and b!166025 res!138281) b!166024))

(assert (= (and b!166024 (not res!138284)) b!166022))

(assert (= (or b!166020 b!166025) bm!2790))

(declare-fun m!263765 () Bool)

(assert (=> b!166021 m!263765))

(declare-fun m!263767 () Bool)

(assert (=> b!166022 m!263767))

(declare-fun m!263769 () Bool)

(assert (=> b!166022 m!263769))

(assert (=> b!166022 m!263767))

(assert (=> b!166022 m!263769))

(declare-fun m!263771 () Bool)

(assert (=> b!166022 m!263771))

(assert (=> b!166023 m!263539))

(assert (=> b!166023 m!263655))

(declare-fun m!263773 () Bool)

(assert (=> bm!2790 m!263773))

(declare-fun m!263775 () Bool)

(assert (=> bm!2790 m!263775))

(assert (=> bm!2790 m!263773))

(assert (=> bm!2790 m!263775))

(declare-fun m!263777 () Bool)

(assert (=> bm!2790 m!263777))

(assert (=> b!165890 d!57647))

(assert (=> b!165890 d!57577))

(declare-fun d!57649 () Bool)

(assert (=> d!57649 (= (byteRangesEq!0 (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259366)) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259366)) lt!259368 (ite c!8611 lt!259367 #b00000000000000000000000000001000)) (or (= lt!259368 (ite c!8611 lt!259367 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 thiss!1577)) (_3!595 lt!259366))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8611 lt!259367 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259368)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4684 (buf!4215 (_2!7879 lt!258841))) (_3!595 lt!259366))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8611 lt!259367 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!259368)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14294 () Bool)

(assert (= bs!14294 d!57649))

(declare-fun m!263779 () Bool)

(assert (=> bs!14294 m!263779))

(declare-fun m!263781 () Bool)

(assert (=> bs!14294 m!263781))

(assert (=> bm!2782 d!57649))

(assert (=> b!165894 d!57569))

(push 1)

(assert (not bm!2789))

(assert (not b!165962))

(assert (not d!57623))

(assert (not d!57613))

(assert (not d!57625))

(assert (not b!166001))

(assert (not bm!2787))

(assert (not b!166023))

(assert (not b!165993))

(assert (not b!165965))

(assert (not b!166022))

(assert (not d!57591))

(assert (not b!165987))

(assert (not b!165999))

(assert (not d!57583))

(assert (not b!165967))

(assert (not d!57611))

(assert (not b!165978))

(assert (not b!165955))

(assert (not d!57627))

(assert (not b!166014))

(assert (not d!57617))

(assert (not bm!2785))

(assert (not b!166016))

(assert (not b!166002))

(assert (not bm!2790))

(assert (not b!165954))

(assert (not b!165980))

(assert (not b!165971))

(assert (not b!166011))

(assert (not b!165953))

(assert (not d!57577))

(assert (not b!166005))

(assert (not b!165986))

(assert (not b!165960))

(assert (not d!57619))

(assert (not bm!2786))

(assert (not b!166015))

(assert (not d!57593))

(assert (not b!165994))

(assert (not b!166021))

(assert (not bm!2784))

(assert (not d!57581))

(assert (not b!165992))

(assert (not b!165966))

(assert (not b!165985))

(assert (not b!165979))

(assert (not d!57605))

(assert (not bm!2788))

(assert (not d!57637))

(assert (not b!165975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

