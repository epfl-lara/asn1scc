; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52232 () Bool)

(assert start!52232)

(declare-fun b!240576 () Bool)

(declare-fun e!166746 () Bool)

(declare-datatypes ((array!13163 0))(
  ( (array!13164 (arr!6753 (Array (_ BitVec 32) (_ BitVec 8))) (size!5766 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10454 0))(
  ( (BitStream!10455 (buf!6226 array!13163) (currentByte!11580 (_ BitVec 32)) (currentBit!11575 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10454)

(declare-fun array_inv!5507 (array!13163) Bool)

(assert (=> b!240576 (= e!166746 (array_inv!5507 (buf!6226 thiss!982)))))

(declare-fun res!200835 () Bool)

(declare-fun e!166745 () Bool)

(assert (=> start!52232 (=> (not res!200835) (not e!166745))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52232 (= res!200835 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52232 e!166745))

(assert (=> start!52232 true))

(declare-fun inv!12 (BitStream!10454) Bool)

(assert (=> start!52232 (and (inv!12 thiss!982) e!166746)))

(declare-fun b!240577 () Bool)

(declare-fun res!200836 () Bool)

(declare-fun e!166748 () Bool)

(assert (=> b!240577 (=> (not res!200836) (not e!166748))))

(declare-datatypes ((Unit!17633 0))(
  ( (Unit!17634) )
))
(declare-datatypes ((tuple2!20448 0))(
  ( (tuple2!20449 (_1!11146 Unit!17633) (_2!11146 BitStream!10454)) )
))
(declare-fun lt!375730 () tuple2!20448)

(declare-fun isPrefixOf!0 (BitStream!10454 BitStream!10454) Bool)

(assert (=> b!240577 (= res!200836 (isPrefixOf!0 thiss!982 (_2!11146 lt!375730)))))

(declare-fun b!240578 () Bool)

(declare-fun res!200834 () Bool)

(assert (=> b!240578 (=> (not res!200834) (not e!166748))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240578 (= res!200834 (= (bitIndex!0 (size!5766 (buf!6226 (_2!11146 lt!375730))) (currentByte!11580 (_2!11146 lt!375730)) (currentBit!11575 (_2!11146 lt!375730))) (bvadd (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)) nBits!288)))))

(declare-fun b!240579 () Bool)

(declare-datatypes ((tuple2!20450 0))(
  ( (tuple2!20451 (_1!11147 BitStream!10454) (_2!11147 Bool)) )
))
(declare-fun lt!375734 () tuple2!20450)

(declare-datatypes ((tuple2!20452 0))(
  ( (tuple2!20453 (_1!11148 BitStream!10454) (_2!11148 BitStream!10454)) )
))
(declare-fun lt!375735 () tuple2!20452)

(assert (=> b!240579 (= e!166748 (not (or (not (_2!11147 lt!375734)) (not (= (_1!11147 lt!375734) (_2!11148 lt!375735))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10454 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20450)

(assert (=> b!240579 (= lt!375734 (checkBitsLoopPure!0 (_1!11148 lt!375735) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240579 (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) nBits!288)))

(declare-fun lt!375732 () Unit!17633)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10454 array!13163 (_ BitVec 64)) Unit!17633)

(assert (=> b!240579 (= lt!375732 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6226 (_2!11146 lt!375730)) nBits!288))))

(declare-fun reader!0 (BitStream!10454 BitStream!10454) tuple2!20452)

(assert (=> b!240579 (= lt!375735 (reader!0 thiss!982 (_2!11146 lt!375730)))))

(declare-fun b!240580 () Bool)

(declare-fun res!200838 () Bool)

(assert (=> b!240580 (=> (not res!200838) (not e!166745))))

(assert (=> b!240580 (= res!200838 (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 thiss!982))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) nBits!288))))

(declare-fun b!240581 () Bool)

(declare-fun lt!375737 () tuple2!20452)

(assert (=> b!240581 (= e!166745 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 (_1!11148 lt!375737)))) ((_ sign_extend 32) (currentByte!11580 (_1!11148 lt!375737))) ((_ sign_extend 32) (currentBit!11575 (_1!11148 lt!375737))) nBits!288)))))

(assert (=> b!240581 (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) nBits!288)))

(declare-fun lt!375736 () Unit!17633)

(assert (=> b!240581 (= lt!375736 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6226 (_2!11146 lt!375730)) nBits!288))))

(assert (=> b!240581 (= lt!375737 (reader!0 thiss!982 (_2!11146 lt!375730)))))

(declare-fun lt!375738 () Bool)

(assert (=> b!240581 (= lt!375738 (isPrefixOf!0 thiss!982 (_2!11146 lt!375730)))))

(declare-fun lt!375731 () (_ BitVec 64))

(assert (=> b!240581 (= lt!375731 (bitIndex!0 (size!5766 (buf!6226 (_2!11146 lt!375730))) (currentByte!11580 (_2!11146 lt!375730)) (currentBit!11575 (_2!11146 lt!375730))))))

(declare-fun lt!375733 () (_ BitVec 64))

(assert (=> b!240581 (= lt!375733 (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)))))

(assert (=> b!240581 e!166748))

(declare-fun res!200837 () Bool)

(assert (=> b!240581 (=> (not res!200837) (not e!166748))))

(assert (=> b!240581 (= res!200837 (= (size!5766 (buf!6226 thiss!982)) (size!5766 (buf!6226 (_2!11146 lt!375730)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10454 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20448)

(assert (=> b!240581 (= lt!375730 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!52232 res!200835) b!240580))

(assert (= (and b!240580 res!200838) b!240581))

(assert (= (and b!240581 res!200837) b!240578))

(assert (= (and b!240578 res!200834) b!240577))

(assert (= (and b!240577 res!200836) b!240579))

(assert (= start!52232 b!240576))

(declare-fun m!363105 () Bool)

(assert (=> b!240577 m!363105))

(declare-fun m!363107 () Bool)

(assert (=> b!240579 m!363107))

(declare-fun m!363109 () Bool)

(assert (=> b!240579 m!363109))

(declare-fun m!363111 () Bool)

(assert (=> b!240579 m!363111))

(declare-fun m!363113 () Bool)

(assert (=> b!240579 m!363113))

(declare-fun m!363115 () Bool)

(assert (=> start!52232 m!363115))

(declare-fun m!363117 () Bool)

(assert (=> b!240580 m!363117))

(declare-fun m!363119 () Bool)

(assert (=> b!240578 m!363119))

(declare-fun m!363121 () Bool)

(assert (=> b!240578 m!363121))

(declare-fun m!363123 () Bool)

(assert (=> b!240576 m!363123))

(declare-fun m!363125 () Bool)

(assert (=> b!240581 m!363125))

(assert (=> b!240581 m!363113))

(assert (=> b!240581 m!363105))

(assert (=> b!240581 m!363111))

(assert (=> b!240581 m!363119))

(declare-fun m!363127 () Bool)

(assert (=> b!240581 m!363127))

(assert (=> b!240581 m!363121))

(assert (=> b!240581 m!363109))

(push 1)

(assert (not start!52232))

(assert (not b!240581))

(assert (not b!240579))

(assert (not b!240578))

(assert (not b!240577))

(assert (not b!240576))

(assert (not b!240580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81324 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!81324 (= (inv!12 thiss!982) (invariant!0 (currentBit!11575 thiss!982) (currentByte!11580 thiss!982) (size!5766 (buf!6226 thiss!982))))))

(declare-fun bs!20514 () Bool)

(assert (= bs!20514 d!81324))

(declare-fun m!363137 () Bool)

(assert (=> bs!20514 m!363137))

(assert (=> start!52232 d!81324))

(declare-fun d!81326 () Bool)

(declare-datatypes ((tuple2!20454 0))(
  ( (tuple2!20455 (_1!11149 Bool) (_2!11149 BitStream!10454)) )
))
(declare-fun lt!375799 () tuple2!20454)

(declare-fun checkBitsLoop!0 (BitStream!10454 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20454)

(assert (=> d!81326 (= lt!375799 (checkBitsLoop!0 (_1!11148 lt!375735) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81326 (= (checkBitsLoopPure!0 (_1!11148 lt!375735) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20451 (_2!11149 lt!375799) (_1!11149 lt!375799)))))

(declare-fun bs!20515 () Bool)

(assert (= bs!20515 d!81326))

(declare-fun m!363139 () Bool)

(assert (=> bs!20515 m!363139))

(assert (=> b!240579 d!81326))

(declare-fun d!81328 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81328 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982))) nBits!288))))

(declare-fun bs!20516 () Bool)

(assert (= bs!20516 d!81328))

(declare-fun m!363141 () Bool)

(assert (=> bs!20516 m!363141))

(assert (=> b!240579 d!81328))

(declare-fun d!81330 () Bool)

(assert (=> d!81330 (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) nBits!288)))

(declare-fun lt!375822 () Unit!17633)

(declare-fun choose!9 (BitStream!10454 array!13163 (_ BitVec 64) BitStream!10454) Unit!17633)

(assert (=> d!81330 (= lt!375822 (choose!9 thiss!982 (buf!6226 (_2!11146 lt!375730)) nBits!288 (BitStream!10455 (buf!6226 (_2!11146 lt!375730)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982))))))

(assert (=> d!81330 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6226 (_2!11146 lt!375730)) nBits!288) lt!375822)))

(declare-fun bs!20517 () Bool)

(assert (= bs!20517 d!81330))

(assert (=> bs!20517 m!363109))

(declare-fun m!363173 () Bool)

(assert (=> bs!20517 m!363173))

(assert (=> b!240579 d!81330))

(declare-fun lt!375916 () (_ BitVec 64))

(declare-fun b!240645 () Bool)

(declare-fun lt!375910 () tuple2!20452)

(declare-fun lt!375904 () (_ BitVec 64))

(declare-fun e!166781 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10454 (_ BitVec 64)) BitStream!10454)

(assert (=> b!240645 (= e!166781 (= (_1!11148 lt!375910) (withMovedBitIndex!0 (_2!11148 lt!375910) (bvsub lt!375916 lt!375904))))))

(assert (=> b!240645 (or (= (bvand lt!375916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375904 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375916 lt!375904) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240645 (= lt!375904 (bitIndex!0 (size!5766 (buf!6226 (_2!11146 lt!375730))) (currentByte!11580 (_2!11146 lt!375730)) (currentBit!11575 (_2!11146 lt!375730))))))

(assert (=> b!240645 (= lt!375916 (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)))))

(declare-fun b!240646 () Bool)

(declare-fun res!200893 () Bool)

(assert (=> b!240646 (=> (not res!200893) (not e!166781))))

(assert (=> b!240646 (= res!200893 (isPrefixOf!0 (_1!11148 lt!375910) thiss!982))))

(declare-fun b!240647 () Bool)

(declare-fun e!166782 () Unit!17633)

(declare-fun lt!375900 () Unit!17633)

(assert (=> b!240647 (= e!166782 lt!375900)))

(declare-fun lt!375905 () (_ BitVec 64))

(assert (=> b!240647 (= lt!375905 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375898 () (_ BitVec 64))

(assert (=> b!240647 (= lt!375898 (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13163 array!13163 (_ BitVec 64) (_ BitVec 64)) Unit!17633)

(assert (=> b!240647 (= lt!375900 (arrayBitRangesEqSymmetric!0 (buf!6226 thiss!982) (buf!6226 (_2!11146 lt!375730)) lt!375905 lt!375898))))

(declare-fun arrayBitRangesEq!0 (array!13163 array!13163 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240647 (arrayBitRangesEq!0 (buf!6226 (_2!11146 lt!375730)) (buf!6226 thiss!982) lt!375905 lt!375898)))

(declare-fun d!81334 () Bool)

(assert (=> d!81334 e!166781))

(declare-fun res!200892 () Bool)

(assert (=> d!81334 (=> (not res!200892) (not e!166781))))

(assert (=> d!81334 (= res!200892 (isPrefixOf!0 (_1!11148 lt!375910) (_2!11148 lt!375910)))))

(declare-fun lt!375902 () BitStream!10454)

(assert (=> d!81334 (= lt!375910 (tuple2!20453 lt!375902 (_2!11146 lt!375730)))))

(declare-fun lt!375914 () Unit!17633)

(declare-fun lt!375913 () Unit!17633)

(assert (=> d!81334 (= lt!375914 lt!375913)))

(assert (=> d!81334 (isPrefixOf!0 lt!375902 (_2!11146 lt!375730))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10454 BitStream!10454 BitStream!10454) Unit!17633)

(assert (=> d!81334 (= lt!375913 (lemmaIsPrefixTransitive!0 lt!375902 (_2!11146 lt!375730) (_2!11146 lt!375730)))))

(declare-fun lt!375909 () Unit!17633)

(declare-fun lt!375912 () Unit!17633)

(assert (=> d!81334 (= lt!375909 lt!375912)))

(assert (=> d!81334 (isPrefixOf!0 lt!375902 (_2!11146 lt!375730))))

(assert (=> d!81334 (= lt!375912 (lemmaIsPrefixTransitive!0 lt!375902 thiss!982 (_2!11146 lt!375730)))))

(declare-fun lt!375906 () Unit!17633)

(assert (=> d!81334 (= lt!375906 e!166782)))

(declare-fun c!11428 () Bool)

(assert (=> d!81334 (= c!11428 (not (= (size!5766 (buf!6226 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!375911 () Unit!17633)

(declare-fun lt!375915 () Unit!17633)

(assert (=> d!81334 (= lt!375911 lt!375915)))

(assert (=> d!81334 (isPrefixOf!0 (_2!11146 lt!375730) (_2!11146 lt!375730))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10454) Unit!17633)

(assert (=> d!81334 (= lt!375915 (lemmaIsPrefixRefl!0 (_2!11146 lt!375730)))))

(declare-fun lt!375899 () Unit!17633)

(declare-fun lt!375901 () Unit!17633)

(assert (=> d!81334 (= lt!375899 lt!375901)))

(assert (=> d!81334 (= lt!375901 (lemmaIsPrefixRefl!0 (_2!11146 lt!375730)))))

(declare-fun lt!375908 () Unit!17633)

(declare-fun lt!375907 () Unit!17633)

(assert (=> d!81334 (= lt!375908 lt!375907)))

(assert (=> d!81334 (isPrefixOf!0 lt!375902 lt!375902)))

(assert (=> d!81334 (= lt!375907 (lemmaIsPrefixRefl!0 lt!375902))))

(declare-fun lt!375903 () Unit!17633)

(declare-fun lt!375897 () Unit!17633)

(assert (=> d!81334 (= lt!375903 lt!375897)))

(assert (=> d!81334 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81334 (= lt!375897 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81334 (= lt!375902 (BitStream!10455 (buf!6226 (_2!11146 lt!375730)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)))))

(assert (=> d!81334 (isPrefixOf!0 thiss!982 (_2!11146 lt!375730))))

(assert (=> d!81334 (= (reader!0 thiss!982 (_2!11146 lt!375730)) lt!375910)))

(declare-fun b!240648 () Bool)

(declare-fun Unit!17637 () Unit!17633)

(assert (=> b!240648 (= e!166782 Unit!17637)))

(declare-fun b!240649 () Bool)

(declare-fun res!200894 () Bool)

(assert (=> b!240649 (=> (not res!200894) (not e!166781))))

(assert (=> b!240649 (= res!200894 (isPrefixOf!0 (_2!11148 lt!375910) (_2!11146 lt!375730)))))

(assert (= (and d!81334 c!11428) b!240647))

(assert (= (and d!81334 (not c!11428)) b!240648))

(assert (= (and d!81334 res!200892) b!240646))

(assert (= (and b!240646 res!200893) b!240649))

(assert (= (and b!240649 res!200894) b!240645))

(assert (=> d!81334 m!363105))

(declare-fun m!363183 () Bool)

(assert (=> d!81334 m!363183))

(declare-fun m!363185 () Bool)

(assert (=> d!81334 m!363185))

(declare-fun m!363187 () Bool)

(assert (=> d!81334 m!363187))

(declare-fun m!363189 () Bool)

(assert (=> d!81334 m!363189))

(declare-fun m!363191 () Bool)

(assert (=> d!81334 m!363191))

(declare-fun m!363193 () Bool)

(assert (=> d!81334 m!363193))

(declare-fun m!363195 () Bool)

(assert (=> d!81334 m!363195))

(declare-fun m!363197 () Bool)

(assert (=> d!81334 m!363197))

(declare-fun m!363199 () Bool)

(assert (=> d!81334 m!363199))

(declare-fun m!363201 () Bool)

(assert (=> d!81334 m!363201))

(declare-fun m!363203 () Bool)

(assert (=> b!240646 m!363203))

(declare-fun m!363205 () Bool)

(assert (=> b!240645 m!363205))

(assert (=> b!240645 m!363119))

(assert (=> b!240645 m!363121))

(declare-fun m!363207 () Bool)

(assert (=> b!240649 m!363207))

(assert (=> b!240647 m!363121))

(declare-fun m!363209 () Bool)

(assert (=> b!240647 m!363209))

(declare-fun m!363213 () Bool)

(assert (=> b!240647 m!363213))

(assert (=> b!240579 d!81334))

(declare-fun d!81342 () Bool)

(declare-fun res!200907 () Bool)

(declare-fun e!166790 () Bool)

(assert (=> d!81342 (=> (not res!200907) (not e!166790))))

(assert (=> d!81342 (= res!200907 (= (size!5766 (buf!6226 thiss!982)) (size!5766 (buf!6226 (_2!11146 lt!375730)))))))

(assert (=> d!81342 (= (isPrefixOf!0 thiss!982 (_2!11146 lt!375730)) e!166790)))

(declare-fun b!240662 () Bool)

(declare-fun res!200909 () Bool)

(assert (=> b!240662 (=> (not res!200909) (not e!166790))))

(assert (=> b!240662 (= res!200909 (bvsle (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)) (bitIndex!0 (size!5766 (buf!6226 (_2!11146 lt!375730))) (currentByte!11580 (_2!11146 lt!375730)) (currentBit!11575 (_2!11146 lt!375730)))))))

(declare-fun b!240663 () Bool)

(declare-fun e!166791 () Bool)

(assert (=> b!240663 (= e!166790 e!166791)))

(declare-fun res!200908 () Bool)

(assert (=> b!240663 (=> res!200908 e!166791)))

(assert (=> b!240663 (= res!200908 (= (size!5766 (buf!6226 thiss!982)) #b00000000000000000000000000000000))))

(declare-fun b!240664 () Bool)

(assert (=> b!240664 (= e!166791 (arrayBitRangesEq!0 (buf!6226 thiss!982) (buf!6226 (_2!11146 lt!375730)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982))))))

(assert (= (and d!81342 res!200907) b!240662))

(assert (= (and b!240662 res!200909) b!240663))

(assert (= (and b!240663 (not res!200908)) b!240664))

(assert (=> b!240662 m!363121))

(assert (=> b!240662 m!363119))

(assert (=> b!240664 m!363121))

(assert (=> b!240664 m!363121))

(declare-fun m!363237 () Bool)

(assert (=> b!240664 m!363237))

(assert (=> b!240577 d!81342))

(declare-fun d!81352 () Bool)

(declare-fun e!166794 () Bool)

(assert (=> d!81352 e!166794))

(declare-fun res!200914 () Bool)

(assert (=> d!81352 (=> (not res!200914) (not e!166794))))

(declare-fun lt!375950 () (_ BitVec 64))

(declare-fun lt!375949 () (_ BitVec 64))

(declare-fun lt!375948 () (_ BitVec 64))

(assert (=> d!81352 (= res!200914 (= lt!375948 (bvsub lt!375950 lt!375949)))))

(assert (=> d!81352 (or (= (bvand lt!375950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375950 lt!375949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81352 (= lt!375949 (remainingBits!0 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))) ((_ sign_extend 32) (currentByte!11580 (_2!11146 lt!375730))) ((_ sign_extend 32) (currentBit!11575 (_2!11146 lt!375730)))))))

(declare-fun lt!375947 () (_ BitVec 64))

(declare-fun lt!375951 () (_ BitVec 64))

(assert (=> d!81352 (= lt!375950 (bvmul lt!375947 lt!375951))))

(assert (=> d!81352 (or (= lt!375947 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!375951 (bvsdiv (bvmul lt!375947 lt!375951) lt!375947)))))

(assert (=> d!81352 (= lt!375951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81352 (= lt!375947 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))))))

(assert (=> d!81352 (= lt!375948 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11580 (_2!11146 lt!375730))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11575 (_2!11146 lt!375730)))))))

(assert (=> d!81352 (invariant!0 (currentBit!11575 (_2!11146 lt!375730)) (currentByte!11580 (_2!11146 lt!375730)) (size!5766 (buf!6226 (_2!11146 lt!375730))))))

(assert (=> d!81352 (= (bitIndex!0 (size!5766 (buf!6226 (_2!11146 lt!375730))) (currentByte!11580 (_2!11146 lt!375730)) (currentBit!11575 (_2!11146 lt!375730))) lt!375948)))

(declare-fun b!240669 () Bool)

(declare-fun res!200915 () Bool)

(assert (=> b!240669 (=> (not res!200915) (not e!166794))))

(assert (=> b!240669 (= res!200915 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!375948))))

(declare-fun b!240670 () Bool)

(declare-fun lt!375946 () (_ BitVec 64))

(assert (=> b!240670 (= e!166794 (bvsle lt!375948 (bvmul lt!375946 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240670 (or (= lt!375946 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!375946 #b0000000000000000000000000000000000000000000000000000000000001000) lt!375946)))))

(assert (=> b!240670 (= lt!375946 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!375730)))))))

(assert (= (and d!81352 res!200914) b!240669))

(assert (= (and b!240669 res!200915) b!240670))

(declare-fun m!363239 () Bool)

(assert (=> d!81352 m!363239))

(declare-fun m!363241 () Bool)

(assert (=> d!81352 m!363241))

(assert (=> b!240578 d!81352))

(declare-fun d!81354 () Bool)

(declare-fun e!166795 () Bool)

(assert (=> d!81354 e!166795))

(declare-fun res!200916 () Bool)

(assert (=> d!81354 (=> (not res!200916) (not e!166795))))

(declare-fun lt!375956 () (_ BitVec 64))

(declare-fun lt!375955 () (_ BitVec 64))

(declare-fun lt!375954 () (_ BitVec 64))

(assert (=> d!81354 (= res!200916 (= lt!375954 (bvsub lt!375956 lt!375955)))))

(assert (=> d!81354 (or (= (bvand lt!375956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!375955 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!375956 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!375956 lt!375955) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81354 (= lt!375955 (remainingBits!0 ((_ sign_extend 32) (size!5766 (buf!6226 thiss!982))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982))))))

(declare-fun lt!375953 () (_ BitVec 64))

(declare-fun lt!375957 () (_ BitVec 64))

(assert (=> d!81354 (= lt!375956 (bvmul lt!375953 lt!375957))))

(assert (=> d!81354 (or (= lt!375953 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!375957 (bvsdiv (bvmul lt!375953 lt!375957) lt!375953)))))

(assert (=> d!81354 (= lt!375957 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81354 (= lt!375953 ((_ sign_extend 32) (size!5766 (buf!6226 thiss!982))))))

(assert (=> d!81354 (= lt!375954 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11580 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11575 thiss!982))))))

(assert (=> d!81354 (invariant!0 (currentBit!11575 thiss!982) (currentByte!11580 thiss!982) (size!5766 (buf!6226 thiss!982)))))

(assert (=> d!81354 (= (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)) lt!375954)))

(declare-fun b!240671 () Bool)

(declare-fun res!200917 () Bool)

(assert (=> b!240671 (=> (not res!200917) (not e!166795))))

(assert (=> b!240671 (= res!200917 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!375954))))

(declare-fun b!240672 () Bool)

(declare-fun lt!375952 () (_ BitVec 64))

(assert (=> b!240672 (= e!166795 (bvsle lt!375954 (bvmul lt!375952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!240672 (or (= lt!375952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!375952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!375952)))))

(assert (=> b!240672 (= lt!375952 ((_ sign_extend 32) (size!5766 (buf!6226 thiss!982))))))

(assert (= (and d!81354 res!200916) b!240671))

(assert (= (and b!240671 res!200917) b!240672))

(declare-fun m!363243 () Bool)

(assert (=> d!81354 m!363243))

(assert (=> d!81354 m!363137))

(assert (=> b!240578 d!81354))

(assert (=> b!240581 d!81352))

(assert (=> b!240581 d!81354))

(assert (=> b!240581 d!81328))

(assert (=> b!240581 d!81342))

(declare-fun b!240711 () Bool)

(declare-fun res!200950 () Bool)

(declare-fun e!166813 () Bool)

(assert (=> b!240711 (=> (not res!200950) (not e!166813))))

(declare-fun lt!376074 () tuple2!20448)

(assert (=> b!240711 (= res!200950 (isPrefixOf!0 thiss!982 (_2!11146 lt!376074)))))

(declare-fun b!240712 () Bool)

(declare-fun lt!376080 () tuple2!20450)

(declare-fun lt!376073 () tuple2!20452)

(assert (=> b!240712 (= e!166813 (and (_2!11147 lt!376080) (= (_1!11147 lt!376080) (_2!11148 lt!376073))))))

(assert (=> b!240712 (= lt!376080 (checkBitsLoopPure!0 (_1!11148 lt!376073) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!376078 () Unit!17633)

(declare-fun lt!376076 () Unit!17633)

(assert (=> b!240712 (= lt!376078 lt!376076)))

(declare-fun lt!376079 () (_ BitVec 64))

(assert (=> b!240712 (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 (_2!11146 lt!376074)))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) lt!376079)))

(assert (=> b!240712 (= lt!376076 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6226 (_2!11146 lt!376074)) lt!376079))))

(declare-fun e!166814 () Bool)

(assert (=> b!240712 e!166814))

(declare-fun res!200952 () Bool)

(assert (=> b!240712 (=> (not res!200952) (not e!166814))))

(assert (=> b!240712 (= res!200952 (and (= (size!5766 (buf!6226 thiss!982)) (size!5766 (buf!6226 (_2!11146 lt!376074)))) (bvsge lt!376079 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240712 (= lt!376079 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240712 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240712 (= lt!376073 (reader!0 thiss!982 (_2!11146 lt!376074)))))

(declare-fun d!81356 () Bool)

(assert (=> d!81356 e!166813))

(declare-fun res!200951 () Bool)

(assert (=> d!81356 (=> (not res!200951) (not e!166813))))

(assert (=> d!81356 (= res!200951 (= (size!5766 (buf!6226 thiss!982)) (size!5766 (buf!6226 (_2!11146 lt!376074)))))))

(declare-fun choose!51 (BitStream!10454 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20448)

(assert (=> d!81356 (= lt!376074 (choose!51 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81356 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81356 (= (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) lt!376074)))

(declare-fun b!240710 () Bool)

(declare-fun res!200949 () Bool)

(assert (=> b!240710 (=> (not res!200949) (not e!166813))))

(declare-fun lt!376075 () (_ BitVec 64))

(declare-fun lt!376077 () (_ BitVec 64))

(assert (=> b!240710 (= res!200949 (= (bitIndex!0 (size!5766 (buf!6226 (_2!11146 lt!376074))) (currentByte!11580 (_2!11146 lt!376074)) (currentBit!11575 (_2!11146 lt!376074))) (bvadd lt!376077 lt!376075)))))

(assert (=> b!240710 (or (not (= (bvand lt!376077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!376075 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!376077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!376077 lt!376075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240710 (= lt!376075 (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240710 (or (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!288 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!240710 (= lt!376077 (bitIndex!0 (size!5766 (buf!6226 thiss!982)) (currentByte!11580 thiss!982) (currentBit!11575 thiss!982)))))

(declare-fun b!240713 () Bool)

(assert (=> b!240713 (= e!166814 (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 thiss!982))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) lt!376079))))

(assert (= (and d!81356 res!200951) b!240710))

(assert (= (and b!240710 res!200949) b!240711))

(assert (= (and b!240711 res!200950) b!240712))

(assert (= (and b!240712 res!200952) b!240713))

(declare-fun m!363303 () Bool)

(assert (=> d!81356 m!363303))

(declare-fun m!363305 () Bool)

(assert (=> b!240712 m!363305))

(declare-fun m!363307 () Bool)

(assert (=> b!240712 m!363307))

(declare-fun m!363309 () Bool)

(assert (=> b!240712 m!363309))

(declare-fun m!363311 () Bool)

(assert (=> b!240712 m!363311))

(declare-fun m!363313 () Bool)

(assert (=> b!240710 m!363313))

(assert (=> b!240710 m!363121))

(declare-fun m!363315 () Bool)

(assert (=> b!240713 m!363315))

(declare-fun m!363317 () Bool)

(assert (=> b!240711 m!363317))

(assert (=> b!240581 d!81356))

(assert (=> b!240581 d!81330))

(declare-fun d!81380 () Bool)

(assert (=> d!81380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 (_1!11148 lt!375737)))) ((_ sign_extend 32) (currentByte!11580 (_1!11148 lt!375737))) ((_ sign_extend 32) (currentBit!11575 (_1!11148 lt!375737))) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5766 (buf!6226 (_1!11148 lt!375737)))) ((_ sign_extend 32) (currentByte!11580 (_1!11148 lt!375737))) ((_ sign_extend 32) (currentBit!11575 (_1!11148 lt!375737)))) nBits!288))))

(declare-fun bs!20529 () Bool)

(assert (= bs!20529 d!81380))

(declare-fun m!363319 () Bool)

(assert (=> bs!20529 m!363319))

(assert (=> b!240581 d!81380))

(assert (=> b!240581 d!81334))

(declare-fun d!81382 () Bool)

(assert (=> d!81382 (= (array_inv!5507 (buf!6226 thiss!982)) (bvsge (size!5766 (buf!6226 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!240576 d!81382))

(declare-fun d!81384 () Bool)

(assert (=> d!81384 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5766 (buf!6226 thiss!982))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5766 (buf!6226 thiss!982))) ((_ sign_extend 32) (currentByte!11580 thiss!982)) ((_ sign_extend 32) (currentBit!11575 thiss!982))) nBits!288))))

(declare-fun bs!20530 () Bool)

(assert (= bs!20530 d!81384))

(assert (=> bs!20530 m!363243))

(assert (=> b!240580 d!81384))

(push 1)

(assert (not d!81328))

(assert (not b!240711))

(assert (not d!81352))

(assert (not d!81384))

(assert (not b!240649))

(assert (not b!240645))

(assert (not d!81380))

(assert (not b!240712))

(assert (not b!240647))

(assert (not d!81330))

(assert (not d!81334))

(assert (not b!240664))

(assert (not d!81356))

(assert (not b!240710))

(assert (not d!81326))

(assert (not d!81354))

(assert (not d!81324))

(assert (not b!240646))

(assert (not b!240662))

(assert (not b!240713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

