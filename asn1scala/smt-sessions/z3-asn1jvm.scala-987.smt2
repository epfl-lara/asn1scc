; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27710 () Bool)

(assert start!27710)

(declare-fun b!142774 () Bool)

(declare-fun res!119193 () Bool)

(declare-fun e!95102 () Bool)

(assert (=> b!142774 (=> (not res!119193) (not e!95102))))

(declare-datatypes ((array!6533 0))(
  ( (array!6534 (arr!3676 (Array (_ BitVec 32) (_ BitVec 8))) (size!2957 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5172 0))(
  ( (BitStream!5173 (buf!3384 array!6533) (currentByte!6262 (_ BitVec 32)) (currentBit!6257 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5172)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142774 (= res!119193 (invariant!0 (currentBit!6257 thiss!1634) (currentByte!6262 thiss!1634) (size!2957 (buf!3384 thiss!1634))))))

(declare-fun b!142775 () Bool)

(declare-fun res!119191 () Bool)

(declare-fun e!95108 () Bool)

(assert (=> b!142775 (=> (not res!119191) (not e!95108))))

(declare-datatypes ((Unit!8908 0))(
  ( (Unit!8909) )
))
(declare-datatypes ((tuple2!12684 0))(
  ( (tuple2!12685 (_1!6681 Unit!8908) (_2!6681 BitStream!5172)) )
))
(declare-fun lt!221330 () tuple2!12684)

(declare-fun lt!221335 () tuple2!12684)

(declare-fun isPrefixOf!0 (BitStream!5172 BitStream!5172) Bool)

(assert (=> b!142775 (= res!119191 (isPrefixOf!0 (_2!6681 lt!221330) (_2!6681 lt!221335)))))

(declare-fun b!142776 () Bool)

(declare-fun e!95105 () Bool)

(declare-fun array_inv!2746 (array!6533) Bool)

(assert (=> b!142776 (= e!95105 (array_inv!2746 (buf!3384 thiss!1634)))))

(declare-datatypes ((tuple2!12686 0))(
  ( (tuple2!12687 (_1!6682 BitStream!5172) (_2!6682 (_ BitVec 8))) )
))
(declare-fun lt!221329 () tuple2!12686)

(declare-fun arr!237 () array!6533)

(declare-fun b!142777 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12688 0))(
  ( (tuple2!12689 (_1!6683 BitStream!5172) (_2!6683 BitStream!5172)) )
))
(declare-fun lt!221325 () tuple2!12688)

(declare-fun e!95109 () Bool)

(assert (=> b!142777 (= e!95109 (and (= (_2!6682 lt!221329) (select (arr!3676 arr!237) from!447)) (= (_1!6682 lt!221329) (_2!6683 lt!221325))))))

(declare-fun readBytePure!0 (BitStream!5172) tuple2!12686)

(assert (=> b!142777 (= lt!221329 (readBytePure!0 (_1!6683 lt!221325)))))

(declare-fun reader!0 (BitStream!5172 BitStream!5172) tuple2!12688)

(assert (=> b!142777 (= lt!221325 (reader!0 thiss!1634 (_2!6681 lt!221330)))))

(declare-fun b!142778 () Bool)

(declare-fun e!95103 () Bool)

(declare-fun lt!221327 () tuple2!12686)

(declare-fun lt!221332 () tuple2!12686)

(assert (=> b!142778 (= e!95103 (= (_2!6682 lt!221327) (_2!6682 lt!221332)))))

(declare-fun res!119195 () Bool)

(assert (=> start!27710 (=> (not res!119195) (not e!95102))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!27710 (= res!119195 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2957 arr!237))))))

(assert (=> start!27710 e!95102))

(assert (=> start!27710 true))

(assert (=> start!27710 (array_inv!2746 arr!237)))

(declare-fun inv!12 (BitStream!5172) Bool)

(assert (=> start!27710 (and (inv!12 thiss!1634) e!95105)))

(declare-fun b!142779 () Bool)

(declare-fun e!95104 () Bool)

(assert (=> b!142779 (= e!95104 (invariant!0 (currentBit!6257 thiss!1634) (currentByte!6262 thiss!1634) (size!2957 (buf!3384 (_2!6681 lt!221330)))))))

(declare-fun b!142780 () Bool)

(declare-fun e!95100 () Bool)

(assert (=> b!142780 (= e!95100 e!95108)))

(declare-fun res!119197 () Bool)

(assert (=> b!142780 (=> (not res!119197) (not e!95108))))

(declare-fun lt!221328 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142780 (= res!119197 (= (bitIndex!0 (size!2957 (buf!3384 (_2!6681 lt!221335))) (currentByte!6262 (_2!6681 lt!221335)) (currentBit!6257 (_2!6681 lt!221335))) (bvadd (bitIndex!0 (size!2957 (buf!3384 (_2!6681 lt!221330))) (currentByte!6262 (_2!6681 lt!221330)) (currentBit!6257 (_2!6681 lt!221330))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221328))))))

(assert (=> b!142780 (= lt!221328 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142781 () Bool)

(declare-fun res!119190 () Bool)

(assert (=> b!142781 (=> (not res!119190) (not e!95109))))

(assert (=> b!142781 (= res!119190 (= (bitIndex!0 (size!2957 (buf!3384 (_2!6681 lt!221330))) (currentByte!6262 (_2!6681 lt!221330)) (currentBit!6257 (_2!6681 lt!221330))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2957 (buf!3384 thiss!1634)) (currentByte!6262 thiss!1634) (currentBit!6257 thiss!1634)))))))

(declare-fun b!142782 () Bool)

(declare-fun e!95107 () Bool)

(assert (=> b!142782 (= e!95108 (not e!95107))))

(declare-fun res!119198 () Bool)

(assert (=> b!142782 (=> res!119198 e!95107)))

(declare-datatypes ((tuple2!12690 0))(
  ( (tuple2!12691 (_1!6684 BitStream!5172) (_2!6684 array!6533)) )
))
(declare-fun lt!221324 () tuple2!12690)

(declare-fun lt!221333 () tuple2!12688)

(assert (=> b!142782 (= res!119198 (or (not (= (size!2957 (_2!6684 lt!221324)) (size!2957 arr!237))) (not (= (_1!6684 lt!221324) (_2!6683 lt!221333)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5172 array!6533 (_ BitVec 32) (_ BitVec 32)) tuple2!12690)

(assert (=> b!142782 (= lt!221324 (readByteArrayLoopPure!0 (_1!6683 lt!221333) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142782 (validate_offset_bits!1 ((_ sign_extend 32) (size!2957 (buf!3384 (_2!6681 lt!221335)))) ((_ sign_extend 32) (currentByte!6262 (_2!6681 lt!221330))) ((_ sign_extend 32) (currentBit!6257 (_2!6681 lt!221330))) lt!221328)))

(declare-fun lt!221331 () Unit!8908)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5172 array!6533 (_ BitVec 64)) Unit!8908)

(assert (=> b!142782 (= lt!221331 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6681 lt!221330) (buf!3384 (_2!6681 lt!221335)) lt!221328))))

(assert (=> b!142782 (= lt!221333 (reader!0 (_2!6681 lt!221330) (_2!6681 lt!221335)))))

(declare-fun b!142783 () Bool)

(declare-fun res!119189 () Bool)

(assert (=> b!142783 (=> (not res!119189) (not e!95102))))

(assert (=> b!142783 (= res!119189 (bvslt from!447 to!404))))

(declare-fun b!142784 () Bool)

(declare-fun lt!221326 () tuple2!12688)

(assert (=> b!142784 (= e!95102 (not (= (_2!6682 (readBytePure!0 (_1!6683 lt!221326))) (select (arr!3676 arr!237) from!447))))))

(declare-fun lt!221323 () tuple2!12688)

(assert (=> b!142784 (= lt!221323 (reader!0 (_2!6681 lt!221330) (_2!6681 lt!221335)))))

(assert (=> b!142784 (= lt!221326 (reader!0 thiss!1634 (_2!6681 lt!221335)))))

(assert (=> b!142784 e!95103))

(declare-fun res!119196 () Bool)

(assert (=> b!142784 (=> (not res!119196) (not e!95103))))

(assert (=> b!142784 (= res!119196 (= (bitIndex!0 (size!2957 (buf!3384 (_1!6682 lt!221327))) (currentByte!6262 (_1!6682 lt!221327)) (currentBit!6257 (_1!6682 lt!221327))) (bitIndex!0 (size!2957 (buf!3384 (_1!6682 lt!221332))) (currentByte!6262 (_1!6682 lt!221332)) (currentBit!6257 (_1!6682 lt!221332)))))))

(declare-fun lt!221334 () Unit!8908)

(declare-fun lt!221336 () BitStream!5172)

(declare-fun readBytePrefixLemma!0 (BitStream!5172 BitStream!5172) Unit!8908)

(assert (=> b!142784 (= lt!221334 (readBytePrefixLemma!0 lt!221336 (_2!6681 lt!221335)))))

(assert (=> b!142784 (= lt!221332 (readBytePure!0 (BitStream!5173 (buf!3384 (_2!6681 lt!221335)) (currentByte!6262 thiss!1634) (currentBit!6257 thiss!1634))))))

(assert (=> b!142784 (= lt!221327 (readBytePure!0 lt!221336))))

(assert (=> b!142784 (= lt!221336 (BitStream!5173 (buf!3384 (_2!6681 lt!221330)) (currentByte!6262 thiss!1634) (currentBit!6257 thiss!1634)))))

(assert (=> b!142784 e!95104))

(declare-fun res!119199 () Bool)

(assert (=> b!142784 (=> (not res!119199) (not e!95104))))

(assert (=> b!142784 (= res!119199 (isPrefixOf!0 thiss!1634 (_2!6681 lt!221335)))))

(declare-fun lt!221322 () Unit!8908)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5172 BitStream!5172 BitStream!5172) Unit!8908)

(assert (=> b!142784 (= lt!221322 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6681 lt!221330) (_2!6681 lt!221335)))))

(assert (=> b!142784 e!95100))

(declare-fun res!119200 () Bool)

(assert (=> b!142784 (=> (not res!119200) (not e!95100))))

(assert (=> b!142784 (= res!119200 (= (size!2957 (buf!3384 (_2!6681 lt!221330))) (size!2957 (buf!3384 (_2!6681 lt!221335)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5172 array!6533 (_ BitVec 32) (_ BitVec 32)) tuple2!12684)

(assert (=> b!142784 (= lt!221335 (appendByteArrayLoop!0 (_2!6681 lt!221330) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142784 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2957 (buf!3384 (_2!6681 lt!221330)))) ((_ sign_extend 32) (currentByte!6262 (_2!6681 lt!221330))) ((_ sign_extend 32) (currentBit!6257 (_2!6681 lt!221330))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221321 () Unit!8908)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5172 BitStream!5172 (_ BitVec 64) (_ BitVec 32)) Unit!8908)

(assert (=> b!142784 (= lt!221321 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6681 lt!221330) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142784 e!95109))

(declare-fun res!119192 () Bool)

(assert (=> b!142784 (=> (not res!119192) (not e!95109))))

(assert (=> b!142784 (= res!119192 (= (size!2957 (buf!3384 thiss!1634)) (size!2957 (buf!3384 (_2!6681 lt!221330)))))))

(declare-fun appendByte!0 (BitStream!5172 (_ BitVec 8)) tuple2!12684)

(assert (=> b!142784 (= lt!221330 (appendByte!0 thiss!1634 (select (arr!3676 arr!237) from!447)))))

(declare-fun b!142785 () Bool)

(declare-fun res!119188 () Bool)

(assert (=> b!142785 (=> (not res!119188) (not e!95109))))

(assert (=> b!142785 (= res!119188 (isPrefixOf!0 thiss!1634 (_2!6681 lt!221330)))))

(declare-fun b!142786 () Bool)

(declare-fun arrayRangesEq!273 (array!6533 array!6533 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142786 (= e!95107 (not (arrayRangesEq!273 arr!237 (_2!6684 lt!221324) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142787 () Bool)

(declare-fun res!119194 () Bool)

(assert (=> b!142787 (=> (not res!119194) (not e!95102))))

(assert (=> b!142787 (= res!119194 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2957 (buf!3384 thiss!1634))) ((_ sign_extend 32) (currentByte!6262 thiss!1634)) ((_ sign_extend 32) (currentBit!6257 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27710 res!119195) b!142787))

(assert (= (and b!142787 res!119194) b!142783))

(assert (= (and b!142783 res!119189) b!142774))

(assert (= (and b!142774 res!119193) b!142784))

(assert (= (and b!142784 res!119192) b!142781))

(assert (= (and b!142781 res!119190) b!142785))

(assert (= (and b!142785 res!119188) b!142777))

(assert (= (and b!142784 res!119200) b!142780))

(assert (= (and b!142780 res!119197) b!142775))

(assert (= (and b!142775 res!119191) b!142782))

(assert (= (and b!142782 (not res!119198)) b!142786))

(assert (= (and b!142784 res!119199) b!142779))

(assert (= (and b!142784 res!119196) b!142778))

(assert (= start!27710 b!142776))

(declare-fun m!219153 () Bool)

(assert (=> b!142775 m!219153))

(declare-fun m!219155 () Bool)

(assert (=> b!142779 m!219155))

(declare-fun m!219157 () Bool)

(assert (=> b!142782 m!219157))

(declare-fun m!219159 () Bool)

(assert (=> b!142782 m!219159))

(declare-fun m!219161 () Bool)

(assert (=> b!142782 m!219161))

(declare-fun m!219163 () Bool)

(assert (=> b!142782 m!219163))

(declare-fun m!219165 () Bool)

(assert (=> b!142784 m!219165))

(assert (=> b!142784 m!219163))

(declare-fun m!219167 () Bool)

(assert (=> b!142784 m!219167))

(declare-fun m!219169 () Bool)

(assert (=> b!142784 m!219169))

(declare-fun m!219171 () Bool)

(assert (=> b!142784 m!219171))

(declare-fun m!219173 () Bool)

(assert (=> b!142784 m!219173))

(declare-fun m!219175 () Bool)

(assert (=> b!142784 m!219175))

(declare-fun m!219177 () Bool)

(assert (=> b!142784 m!219177))

(declare-fun m!219179 () Bool)

(assert (=> b!142784 m!219179))

(declare-fun m!219181 () Bool)

(assert (=> b!142784 m!219181))

(declare-fun m!219183 () Bool)

(assert (=> b!142784 m!219183))

(declare-fun m!219185 () Bool)

(assert (=> b!142784 m!219185))

(declare-fun m!219187 () Bool)

(assert (=> b!142784 m!219187))

(assert (=> b!142784 m!219183))

(declare-fun m!219189 () Bool)

(assert (=> b!142784 m!219189))

(declare-fun m!219191 () Bool)

(assert (=> b!142784 m!219191))

(declare-fun m!219193 () Bool)

(assert (=> start!27710 m!219193))

(declare-fun m!219195 () Bool)

(assert (=> start!27710 m!219195))

(declare-fun m!219197 () Bool)

(assert (=> b!142785 m!219197))

(declare-fun m!219199 () Bool)

(assert (=> b!142781 m!219199))

(declare-fun m!219201 () Bool)

(assert (=> b!142781 m!219201))

(declare-fun m!219203 () Bool)

(assert (=> b!142780 m!219203))

(assert (=> b!142780 m!219199))

(assert (=> b!142777 m!219183))

(declare-fun m!219205 () Bool)

(assert (=> b!142777 m!219205))

(declare-fun m!219207 () Bool)

(assert (=> b!142777 m!219207))

(declare-fun m!219209 () Bool)

(assert (=> b!142787 m!219209))

(declare-fun m!219211 () Bool)

(assert (=> b!142776 m!219211))

(declare-fun m!219213 () Bool)

(assert (=> b!142786 m!219213))

(declare-fun m!219215 () Bool)

(assert (=> b!142774 m!219215))

(check-sat (not b!142776) (not b!142785) (not b!142787) (not b!142781) (not b!142784) (not b!142779) (not b!142786) (not start!27710) (not b!142775) (not b!142780) (not b!142777) (not b!142774) (not b!142782))
(check-sat)
