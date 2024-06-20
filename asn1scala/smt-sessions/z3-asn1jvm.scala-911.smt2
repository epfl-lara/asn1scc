; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25542 () Bool)

(assert start!25542)

(declare-fun b!130147 () Bool)

(declare-fun res!107866 () Bool)

(declare-fun e!86267 () Bool)

(assert (=> b!130147 (=> (not res!107866) (not e!86267))))

(declare-datatypes ((array!6027 0))(
  ( (array!6028 (arr!3346 (Array (_ BitVec 32) (_ BitVec 8))) (size!2729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4722 0))(
  ( (BitStream!4723 (buf!3087 array!6027) (currentByte!5848 (_ BitVec 32)) (currentBit!5843 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4722)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130147 (= res!107866 (invariant!0 (currentBit!5843 thiss!1634) (currentByte!5848 thiss!1634) (size!2729 (buf!3087 thiss!1634))))))

(declare-fun res!107863 () Bool)

(assert (=> start!25542 (=> (not res!107863) (not e!86267))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6027)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25542 (= res!107863 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2729 arr!237))))))

(assert (=> start!25542 e!86267))

(assert (=> start!25542 true))

(declare-fun array_inv!2518 (array!6027) Bool)

(assert (=> start!25542 (array_inv!2518 arr!237)))

(declare-fun e!86270 () Bool)

(declare-fun inv!12 (BitStream!4722) Bool)

(assert (=> start!25542 (and (inv!12 thiss!1634) e!86270)))

(declare-fun b!130148 () Bool)

(declare-fun e!86261 () Bool)

(declare-fun e!86266 () Bool)

(assert (=> b!130148 (= e!86261 e!86266)))

(declare-fun res!107859 () Bool)

(assert (=> b!130148 (=> (not res!107859) (not e!86266))))

(declare-datatypes ((Unit!8063 0))(
  ( (Unit!8064) )
))
(declare-datatypes ((tuple2!11190 0))(
  ( (tuple2!11191 (_1!5892 Unit!8063) (_2!5892 BitStream!4722)) )
))
(declare-fun lt!200716 () tuple2!11190)

(declare-fun lt!200711 () (_ BitVec 64))

(declare-fun lt!200714 () tuple2!11190)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130148 (= res!107859 (= (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200714))) (currentByte!5848 (_2!5892 lt!200714)) (currentBit!5843 (_2!5892 lt!200714))) (bvadd (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200711))))))

(assert (=> b!130148 (= lt!200711 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130149 () Bool)

(declare-fun res!107862 () Bool)

(declare-fun e!86269 () Bool)

(assert (=> b!130149 (=> (not res!107862) (not e!86269))))

(declare-fun isPrefixOf!0 (BitStream!4722 BitStream!4722) Bool)

(assert (=> b!130149 (= res!107862 (isPrefixOf!0 thiss!1634 (_2!5892 lt!200716)))))

(declare-fun b!130150 () Bool)

(declare-fun e!86265 () Bool)

(declare-datatypes ((tuple2!11192 0))(
  ( (tuple2!11193 (_1!5893 BitStream!4722) (_2!5893 (_ BitVec 8))) )
))
(declare-fun lt!200718 () tuple2!11192)

(declare-fun lt!200713 () tuple2!11192)

(assert (=> b!130150 (= e!86265 (= (_2!5893 lt!200718) (_2!5893 lt!200713)))))

(declare-fun b!130151 () Bool)

(declare-fun res!107865 () Bool)

(assert (=> b!130151 (=> (not res!107865) (not e!86267))))

(assert (=> b!130151 (= res!107865 (bvslt from!447 to!404))))

(declare-fun b!130152 () Bool)

(assert (=> b!130152 (= e!86270 (array_inv!2518 (buf!3087 thiss!1634)))))

(declare-fun b!130153 () Bool)

(declare-datatypes ((tuple2!11194 0))(
  ( (tuple2!11195 (_1!5894 BitStream!4722) (_2!5894 BitStream!4722)) )
))
(declare-fun lt!200723 () tuple2!11194)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130153 (= e!86267 (not (validate_offset_byte!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5894 lt!200723)))) ((_ sign_extend 32) (currentByte!5848 (_1!5894 lt!200723))) ((_ sign_extend 32) (currentBit!5843 (_1!5894 lt!200723))))))))

(declare-fun lt!200717 () tuple2!11194)

(declare-fun reader!0 (BitStream!4722 BitStream!4722) tuple2!11194)

(assert (=> b!130153 (= lt!200717 (reader!0 (_2!5892 lt!200716) (_2!5892 lt!200714)))))

(assert (=> b!130153 (= lt!200723 (reader!0 thiss!1634 (_2!5892 lt!200714)))))

(assert (=> b!130153 e!86265))

(declare-fun res!107869 () Bool)

(assert (=> b!130153 (=> (not res!107869) (not e!86265))))

(assert (=> b!130153 (= res!107869 (= (bitIndex!0 (size!2729 (buf!3087 (_1!5893 lt!200718))) (currentByte!5848 (_1!5893 lt!200718)) (currentBit!5843 (_1!5893 lt!200718))) (bitIndex!0 (size!2729 (buf!3087 (_1!5893 lt!200713))) (currentByte!5848 (_1!5893 lt!200713)) (currentBit!5843 (_1!5893 lt!200713)))))))

(declare-fun lt!200719 () Unit!8063)

(declare-fun lt!200710 () BitStream!4722)

(declare-fun readBytePrefixLemma!0 (BitStream!4722 BitStream!4722) Unit!8063)

(assert (=> b!130153 (= lt!200719 (readBytePrefixLemma!0 lt!200710 (_2!5892 lt!200714)))))

(declare-fun readBytePure!0 (BitStream!4722) tuple2!11192)

(assert (=> b!130153 (= lt!200713 (readBytePure!0 (BitStream!4723 (buf!3087 (_2!5892 lt!200714)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634))))))

(assert (=> b!130153 (= lt!200718 (readBytePure!0 lt!200710))))

(assert (=> b!130153 (= lt!200710 (BitStream!4723 (buf!3087 (_2!5892 lt!200716)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(declare-fun e!86264 () Bool)

(assert (=> b!130153 e!86264))

(declare-fun res!107860 () Bool)

(assert (=> b!130153 (=> (not res!107860) (not e!86264))))

(assert (=> b!130153 (= res!107860 (isPrefixOf!0 thiss!1634 (_2!5892 lt!200714)))))

(declare-fun lt!200708 () Unit!8063)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4722 BitStream!4722 BitStream!4722) Unit!8063)

(assert (=> b!130153 (= lt!200708 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5892 lt!200716) (_2!5892 lt!200714)))))

(assert (=> b!130153 e!86261))

(declare-fun res!107861 () Bool)

(assert (=> b!130153 (=> (not res!107861) (not e!86261))))

(assert (=> b!130153 (= res!107861 (= (size!2729 (buf!3087 (_2!5892 lt!200716))) (size!2729 (buf!3087 (_2!5892 lt!200714)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4722 array!6027 (_ BitVec 32) (_ BitVec 32)) tuple2!11190)

(assert (=> b!130153 (= lt!200714 (appendByteArrayLoop!0 (_2!5892 lt!200716) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130153 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200715 () Unit!8063)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4722 BitStream!4722 (_ BitVec 64) (_ BitVec 32)) Unit!8063)

(assert (=> b!130153 (= lt!200715 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5892 lt!200716) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130153 e!86269))

(declare-fun res!107857 () Bool)

(assert (=> b!130153 (=> (not res!107857) (not e!86269))))

(assert (=> b!130153 (= res!107857 (= (size!2729 (buf!3087 thiss!1634)) (size!2729 (buf!3087 (_2!5892 lt!200716)))))))

(declare-fun appendByte!0 (BitStream!4722 (_ BitVec 8)) tuple2!11190)

(assert (=> b!130153 (= lt!200716 (appendByte!0 thiss!1634 (select (arr!3346 arr!237) from!447)))))

(declare-fun lt!200721 () tuple2!11192)

(declare-fun lt!200720 () tuple2!11194)

(declare-fun b!130154 () Bool)

(assert (=> b!130154 (= e!86269 (and (= (_2!5893 lt!200721) (select (arr!3346 arr!237) from!447)) (= (_1!5893 lt!200721) (_2!5894 lt!200720))))))

(assert (=> b!130154 (= lt!200721 (readBytePure!0 (_1!5894 lt!200720)))))

(assert (=> b!130154 (= lt!200720 (reader!0 thiss!1634 (_2!5892 lt!200716)))))

(declare-fun b!130155 () Bool)

(declare-fun res!107864 () Bool)

(assert (=> b!130155 (=> (not res!107864) (not e!86266))))

(assert (=> b!130155 (= res!107864 (isPrefixOf!0 (_2!5892 lt!200716) (_2!5892 lt!200714)))))

(declare-fun b!130156 () Bool)

(declare-fun e!86262 () Bool)

(assert (=> b!130156 (= e!86266 (not e!86262))))

(declare-fun res!107858 () Bool)

(assert (=> b!130156 (=> res!107858 e!86262)))

(declare-fun lt!200709 () tuple2!11194)

(declare-datatypes ((tuple2!11196 0))(
  ( (tuple2!11197 (_1!5895 BitStream!4722) (_2!5895 array!6027)) )
))
(declare-fun lt!200712 () tuple2!11196)

(assert (=> b!130156 (= res!107858 (or (not (= (size!2729 (_2!5895 lt!200712)) (size!2729 arr!237))) (not (= (_1!5895 lt!200712) (_2!5894 lt!200709)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4722 array!6027 (_ BitVec 32) (_ BitVec 32)) tuple2!11196)

(assert (=> b!130156 (= lt!200712 (readByteArrayLoopPure!0 (_1!5894 lt!200709) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130156 (validate_offset_bits!1 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200714)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) lt!200711)))

(declare-fun lt!200722 () Unit!8063)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4722 array!6027 (_ BitVec 64)) Unit!8063)

(assert (=> b!130156 (= lt!200722 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5892 lt!200716) (buf!3087 (_2!5892 lt!200714)) lt!200711))))

(assert (=> b!130156 (= lt!200709 (reader!0 (_2!5892 lt!200716) (_2!5892 lt!200714)))))

(declare-fun b!130157 () Bool)

(declare-fun arrayRangesEq!132 (array!6027 array!6027 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130157 (= e!86262 (not (arrayRangesEq!132 arr!237 (_2!5895 lt!200712) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130158 () Bool)

(assert (=> b!130158 (= e!86264 (invariant!0 (currentBit!5843 thiss!1634) (currentByte!5848 thiss!1634) (size!2729 (buf!3087 (_2!5892 lt!200716)))))))

(declare-fun b!130159 () Bool)

(declare-fun res!107868 () Bool)

(assert (=> b!130159 (=> (not res!107868) (not e!86267))))

(assert (=> b!130159 (= res!107868 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2729 (buf!3087 thiss!1634))) ((_ sign_extend 32) (currentByte!5848 thiss!1634)) ((_ sign_extend 32) (currentBit!5843 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130160 () Bool)

(declare-fun res!107867 () Bool)

(assert (=> b!130160 (=> (not res!107867) (not e!86269))))

(assert (=> b!130160 (= res!107867 (= (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))))

(assert (= (and start!25542 res!107863) b!130159))

(assert (= (and b!130159 res!107868) b!130151))

(assert (= (and b!130151 res!107865) b!130147))

(assert (= (and b!130147 res!107866) b!130153))

(assert (= (and b!130153 res!107857) b!130160))

(assert (= (and b!130160 res!107867) b!130149))

(assert (= (and b!130149 res!107862) b!130154))

(assert (= (and b!130153 res!107861) b!130148))

(assert (= (and b!130148 res!107859) b!130155))

(assert (= (and b!130155 res!107864) b!130156))

(assert (= (and b!130156 (not res!107858)) b!130157))

(assert (= (and b!130153 res!107860) b!130158))

(assert (= (and b!130153 res!107869) b!130150))

(assert (= start!25542 b!130152))

(declare-fun m!196211 () Bool)

(assert (=> b!130156 m!196211))

(declare-fun m!196213 () Bool)

(assert (=> b!130156 m!196213))

(declare-fun m!196215 () Bool)

(assert (=> b!130156 m!196215))

(declare-fun m!196217 () Bool)

(assert (=> b!130156 m!196217))

(declare-fun m!196219 () Bool)

(assert (=> b!130160 m!196219))

(declare-fun m!196221 () Bool)

(assert (=> b!130160 m!196221))

(declare-fun m!196223 () Bool)

(assert (=> b!130148 m!196223))

(assert (=> b!130148 m!196219))

(declare-fun m!196225 () Bool)

(assert (=> b!130154 m!196225))

(declare-fun m!196227 () Bool)

(assert (=> b!130154 m!196227))

(declare-fun m!196229 () Bool)

(assert (=> b!130154 m!196229))

(declare-fun m!196231 () Bool)

(assert (=> start!25542 m!196231))

(declare-fun m!196233 () Bool)

(assert (=> start!25542 m!196233))

(declare-fun m!196235 () Bool)

(assert (=> b!130149 m!196235))

(declare-fun m!196237 () Bool)

(assert (=> b!130153 m!196237))

(declare-fun m!196239 () Bool)

(assert (=> b!130153 m!196239))

(declare-fun m!196241 () Bool)

(assert (=> b!130153 m!196241))

(assert (=> b!130153 m!196217))

(declare-fun m!196243 () Bool)

(assert (=> b!130153 m!196243))

(declare-fun m!196245 () Bool)

(assert (=> b!130153 m!196245))

(declare-fun m!196247 () Bool)

(assert (=> b!130153 m!196247))

(declare-fun m!196249 () Bool)

(assert (=> b!130153 m!196249))

(assert (=> b!130153 m!196225))

(declare-fun m!196251 () Bool)

(assert (=> b!130153 m!196251))

(declare-fun m!196253 () Bool)

(assert (=> b!130153 m!196253))

(assert (=> b!130153 m!196225))

(declare-fun m!196255 () Bool)

(assert (=> b!130153 m!196255))

(declare-fun m!196257 () Bool)

(assert (=> b!130153 m!196257))

(declare-fun m!196259 () Bool)

(assert (=> b!130153 m!196259))

(declare-fun m!196261 () Bool)

(assert (=> b!130153 m!196261))

(declare-fun m!196263 () Bool)

(assert (=> b!130155 m!196263))

(declare-fun m!196265 () Bool)

(assert (=> b!130152 m!196265))

(declare-fun m!196267 () Bool)

(assert (=> b!130159 m!196267))

(declare-fun m!196269 () Bool)

(assert (=> b!130147 m!196269))

(declare-fun m!196271 () Bool)

(assert (=> b!130157 m!196271))

(declare-fun m!196273 () Bool)

(assert (=> b!130158 m!196273))

(check-sat (not b!130149) (not b!130152) (not b!130155) (not b!130153) (not b!130147) (not b!130154) (not start!25542) (not b!130160) (not b!130158) (not b!130157) (not b!130148) (not b!130159) (not b!130156))
(check-sat)
(get-model)

(declare-fun d!41518 () Bool)

(declare-fun res!107913 () Bool)

(declare-fun e!86305 () Bool)

(assert (=> d!41518 (=> res!107913 e!86305)))

(assert (=> d!41518 (= res!107913 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41518 (= (arrayRangesEq!132 arr!237 (_2!5895 lt!200712) #b00000000000000000000000000000000 to!404) e!86305)))

(declare-fun b!130207 () Bool)

(declare-fun e!86306 () Bool)

(assert (=> b!130207 (= e!86305 e!86306)))

(declare-fun res!107914 () Bool)

(assert (=> b!130207 (=> (not res!107914) (not e!86306))))

(assert (=> b!130207 (= res!107914 (= (select (arr!3346 arr!237) #b00000000000000000000000000000000) (select (arr!3346 (_2!5895 lt!200712)) #b00000000000000000000000000000000)))))

(declare-fun b!130208 () Bool)

(assert (=> b!130208 (= e!86306 (arrayRangesEq!132 arr!237 (_2!5895 lt!200712) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41518 (not res!107913)) b!130207))

(assert (= (and b!130207 res!107914) b!130208))

(declare-fun m!196339 () Bool)

(assert (=> b!130207 m!196339))

(declare-fun m!196341 () Bool)

(assert (=> b!130207 m!196341))

(declare-fun m!196343 () Bool)

(assert (=> b!130208 m!196343))

(assert (=> b!130157 d!41518))

(declare-fun d!41520 () Bool)

(declare-fun e!86309 () Bool)

(assert (=> d!41520 e!86309))

(declare-fun res!107920 () Bool)

(assert (=> d!41520 (=> (not res!107920) (not e!86309))))

(declare-fun lt!200787 () (_ BitVec 64))

(declare-fun lt!200789 () (_ BitVec 64))

(declare-fun lt!200786 () (_ BitVec 64))

(assert (=> d!41520 (= res!107920 (= lt!200789 (bvsub lt!200786 lt!200787)))))

(assert (=> d!41520 (or (= (bvand lt!200786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200786 lt!200787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41520 (= lt!200787 (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200714)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200714))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200714)))))))

(declare-fun lt!200784 () (_ BitVec 64))

(declare-fun lt!200785 () (_ BitVec 64))

(assert (=> d!41520 (= lt!200786 (bvmul lt!200784 lt!200785))))

(assert (=> d!41520 (or (= lt!200784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200785 (bvsdiv (bvmul lt!200784 lt!200785) lt!200784)))))

(assert (=> d!41520 (= lt!200785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41520 (= lt!200784 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200714)))))))

(assert (=> d!41520 (= lt!200789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200714))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200714)))))))

(assert (=> d!41520 (invariant!0 (currentBit!5843 (_2!5892 lt!200714)) (currentByte!5848 (_2!5892 lt!200714)) (size!2729 (buf!3087 (_2!5892 lt!200714))))))

(assert (=> d!41520 (= (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200714))) (currentByte!5848 (_2!5892 lt!200714)) (currentBit!5843 (_2!5892 lt!200714))) lt!200789)))

(declare-fun b!130213 () Bool)

(declare-fun res!107919 () Bool)

(assert (=> b!130213 (=> (not res!107919) (not e!86309))))

(assert (=> b!130213 (= res!107919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200789))))

(declare-fun b!130214 () Bool)

(declare-fun lt!200788 () (_ BitVec 64))

(assert (=> b!130214 (= e!86309 (bvsle lt!200789 (bvmul lt!200788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130214 (or (= lt!200788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200788)))))

(assert (=> b!130214 (= lt!200788 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200714)))))))

(assert (= (and d!41520 res!107920) b!130213))

(assert (= (and b!130213 res!107919) b!130214))

(declare-fun m!196345 () Bool)

(assert (=> d!41520 m!196345))

(declare-fun m!196347 () Bool)

(assert (=> d!41520 m!196347))

(assert (=> b!130148 d!41520))

(declare-fun d!41522 () Bool)

(declare-fun e!86310 () Bool)

(assert (=> d!41522 e!86310))

(declare-fun res!107922 () Bool)

(assert (=> d!41522 (=> (not res!107922) (not e!86310))))

(declare-fun lt!200795 () (_ BitVec 64))

(declare-fun lt!200792 () (_ BitVec 64))

(declare-fun lt!200793 () (_ BitVec 64))

(assert (=> d!41522 (= res!107922 (= lt!200795 (bvsub lt!200792 lt!200793)))))

(assert (=> d!41522 (or (= (bvand lt!200792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200792 lt!200793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41522 (= lt!200793 (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716)))))))

(declare-fun lt!200790 () (_ BitVec 64))

(declare-fun lt!200791 () (_ BitVec 64))

(assert (=> d!41522 (= lt!200792 (bvmul lt!200790 lt!200791))))

(assert (=> d!41522 (or (= lt!200790 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200791 (bvsdiv (bvmul lt!200790 lt!200791) lt!200790)))))

(assert (=> d!41522 (= lt!200791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41522 (= lt!200790 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))))))

(assert (=> d!41522 (= lt!200795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716)))))))

(assert (=> d!41522 (invariant!0 (currentBit!5843 (_2!5892 lt!200716)) (currentByte!5848 (_2!5892 lt!200716)) (size!2729 (buf!3087 (_2!5892 lt!200716))))))

(assert (=> d!41522 (= (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))) lt!200795)))

(declare-fun b!130215 () Bool)

(declare-fun res!107921 () Bool)

(assert (=> b!130215 (=> (not res!107921) (not e!86310))))

(assert (=> b!130215 (= res!107921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200795))))

(declare-fun b!130216 () Bool)

(declare-fun lt!200794 () (_ BitVec 64))

(assert (=> b!130216 (= e!86310 (bvsle lt!200795 (bvmul lt!200794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130216 (or (= lt!200794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200794)))))

(assert (=> b!130216 (= lt!200794 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))))))

(assert (= (and d!41522 res!107922) b!130215))

(assert (= (and b!130215 res!107921) b!130216))

(declare-fun m!196349 () Bool)

(assert (=> d!41522 m!196349))

(declare-fun m!196351 () Bool)

(assert (=> d!41522 m!196351))

(assert (=> b!130148 d!41522))

(declare-fun d!41524 () Bool)

(assert (=> d!41524 (= (invariant!0 (currentBit!5843 thiss!1634) (currentByte!5848 thiss!1634) (size!2729 (buf!3087 thiss!1634))) (and (bvsge (currentBit!5843 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5843 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5848 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5848 thiss!1634) (size!2729 (buf!3087 thiss!1634))) (and (= (currentBit!5843 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5848 thiss!1634) (size!2729 (buf!3087 thiss!1634)))))))))

(assert (=> b!130147 d!41524))

(declare-fun d!41526 () Bool)

(assert (=> d!41526 (= (invariant!0 (currentBit!5843 thiss!1634) (currentByte!5848 thiss!1634) (size!2729 (buf!3087 (_2!5892 lt!200716)))) (and (bvsge (currentBit!5843 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5843 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5848 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5848 thiss!1634) (size!2729 (buf!3087 (_2!5892 lt!200716)))) (and (= (currentBit!5843 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5848 thiss!1634) (size!2729 (buf!3087 (_2!5892 lt!200716))))))))))

(assert (=> b!130158 d!41526))

(declare-fun d!41528 () Bool)

(declare-fun res!107929 () Bool)

(declare-fun e!86315 () Bool)

(assert (=> d!41528 (=> (not res!107929) (not e!86315))))

(assert (=> d!41528 (= res!107929 (= (size!2729 (buf!3087 thiss!1634)) (size!2729 (buf!3087 (_2!5892 lt!200716)))))))

(assert (=> d!41528 (= (isPrefixOf!0 thiss!1634 (_2!5892 lt!200716)) e!86315)))

(declare-fun b!130223 () Bool)

(declare-fun res!107930 () Bool)

(assert (=> b!130223 (=> (not res!107930) (not e!86315))))

(assert (=> b!130223 (= res!107930 (bvsle (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)) (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716)))))))

(declare-fun b!130224 () Bool)

(declare-fun e!86316 () Bool)

(assert (=> b!130224 (= e!86315 e!86316)))

(declare-fun res!107931 () Bool)

(assert (=> b!130224 (=> res!107931 e!86316)))

(assert (=> b!130224 (= res!107931 (= (size!2729 (buf!3087 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!130225 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6027 array!6027 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130225 (= e!86316 (arrayBitRangesEq!0 (buf!3087 thiss!1634) (buf!3087 (_2!5892 lt!200716)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634))))))

(assert (= (and d!41528 res!107929) b!130223))

(assert (= (and b!130223 res!107930) b!130224))

(assert (= (and b!130224 (not res!107931)) b!130225))

(assert (=> b!130223 m!196221))

(assert (=> b!130223 m!196219))

(assert (=> b!130225 m!196221))

(assert (=> b!130225 m!196221))

(declare-fun m!196353 () Bool)

(assert (=> b!130225 m!196353))

(assert (=> b!130149 d!41528))

(assert (=> b!130160 d!41522))

(declare-fun d!41530 () Bool)

(declare-fun e!86317 () Bool)

(assert (=> d!41530 e!86317))

(declare-fun res!107933 () Bool)

(assert (=> d!41530 (=> (not res!107933) (not e!86317))))

(declare-fun lt!200801 () (_ BitVec 64))

(declare-fun lt!200799 () (_ BitVec 64))

(declare-fun lt!200798 () (_ BitVec 64))

(assert (=> d!41530 (= res!107933 (= lt!200801 (bvsub lt!200798 lt!200799)))))

(assert (=> d!41530 (or (= (bvand lt!200798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200798 lt!200799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41530 (= lt!200799 (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 thiss!1634))) ((_ sign_extend 32) (currentByte!5848 thiss!1634)) ((_ sign_extend 32) (currentBit!5843 thiss!1634))))))

(declare-fun lt!200796 () (_ BitVec 64))

(declare-fun lt!200797 () (_ BitVec 64))

(assert (=> d!41530 (= lt!200798 (bvmul lt!200796 lt!200797))))

(assert (=> d!41530 (or (= lt!200796 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200797 (bvsdiv (bvmul lt!200796 lt!200797) lt!200796)))))

(assert (=> d!41530 (= lt!200797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41530 (= lt!200796 ((_ sign_extend 32) (size!2729 (buf!3087 thiss!1634))))))

(assert (=> d!41530 (= lt!200801 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5848 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5843 thiss!1634))))))

(assert (=> d!41530 (invariant!0 (currentBit!5843 thiss!1634) (currentByte!5848 thiss!1634) (size!2729 (buf!3087 thiss!1634)))))

(assert (=> d!41530 (= (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)) lt!200801)))

(declare-fun b!130226 () Bool)

(declare-fun res!107932 () Bool)

(assert (=> b!130226 (=> (not res!107932) (not e!86317))))

(assert (=> b!130226 (= res!107932 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200801))))

(declare-fun b!130227 () Bool)

(declare-fun lt!200800 () (_ BitVec 64))

(assert (=> b!130227 (= e!86317 (bvsle lt!200801 (bvmul lt!200800 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130227 (or (= lt!200800 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200800 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200800)))))

(assert (=> b!130227 (= lt!200800 ((_ sign_extend 32) (size!2729 (buf!3087 thiss!1634))))))

(assert (= (and d!41530 res!107933) b!130226))

(assert (= (and b!130226 res!107932) b!130227))

(declare-fun m!196355 () Bool)

(assert (=> d!41530 m!196355))

(assert (=> d!41530 m!196269))

(assert (=> b!130160 d!41530))

(declare-fun d!41532 () Bool)

(assert (=> d!41532 (= (array_inv!2518 arr!237) (bvsge (size!2729 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25542 d!41532))

(declare-fun d!41534 () Bool)

(assert (=> d!41534 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5843 thiss!1634) (currentByte!5848 thiss!1634) (size!2729 (buf!3087 thiss!1634))))))

(declare-fun bs!10140 () Bool)

(assert (= bs!10140 d!41534))

(assert (=> bs!10140 m!196269))

(assert (=> start!25542 d!41534))

(declare-fun d!41536 () Bool)

(assert (=> d!41536 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2729 (buf!3087 thiss!1634))) ((_ sign_extend 32) (currentByte!5848 thiss!1634)) ((_ sign_extend 32) (currentBit!5843 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 thiss!1634))) ((_ sign_extend 32) (currentByte!5848 thiss!1634)) ((_ sign_extend 32) (currentBit!5843 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10141 () Bool)

(assert (= bs!10141 d!41536))

(assert (=> bs!10141 m!196355))

(assert (=> b!130159 d!41536))

(declare-fun d!41538 () Bool)

(assert (=> d!41538 (= (array_inv!2518 (buf!3087 thiss!1634)) (bvsge (size!2729 (buf!3087 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!130152 d!41538))

(declare-fun d!41540 () Bool)

(declare-datatypes ((tuple2!11206 0))(
  ( (tuple2!11207 (_1!5900 (_ BitVec 8)) (_2!5900 BitStream!4722)) )
))
(declare-fun lt!200804 () tuple2!11206)

(declare-fun readByte!0 (BitStream!4722) tuple2!11206)

(assert (=> d!41540 (= lt!200804 (readByte!0 lt!200710))))

(assert (=> d!41540 (= (readBytePure!0 lt!200710) (tuple2!11193 (_2!5900 lt!200804) (_1!5900 lt!200804)))))

(declare-fun bs!10142 () Bool)

(assert (= bs!10142 d!41540))

(declare-fun m!196357 () Bool)

(assert (=> bs!10142 m!196357))

(assert (=> b!130153 d!41540))

(declare-fun b!130238 () Bool)

(declare-fun res!107946 () Bool)

(declare-fun e!86325 () Bool)

(assert (=> b!130238 (=> (not res!107946) (not e!86325))))

(declare-fun lt!200831 () tuple2!11190)

(assert (=> b!130238 (= res!107946 (isPrefixOf!0 (_2!5892 lt!200716) (_2!5892 lt!200831)))))

(declare-fun b!130240 () Bool)

(declare-fun e!86326 () Bool)

(declare-fun lt!200825 () (_ BitVec 64))

(assert (=> b!130240 (= e!86326 (validate_offset_bits!1 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) lt!200825))))

(declare-fun b!130241 () Bool)

(declare-fun e!86324 () Bool)

(assert (=> b!130241 (= e!86325 e!86324)))

(declare-fun res!107944 () Bool)

(assert (=> b!130241 (=> (not res!107944) (not e!86324))))

(declare-fun lt!200830 () tuple2!11194)

(declare-fun lt!200828 () tuple2!11196)

(assert (=> b!130241 (= res!107944 (and (= (size!2729 (_2!5895 lt!200828)) (size!2729 arr!237)) (= (_1!5895 lt!200828) (_2!5894 lt!200830))))))

(assert (=> b!130241 (= lt!200828 (readByteArrayLoopPure!0 (_1!5894 lt!200830) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!200826 () Unit!8063)

(declare-fun lt!200827 () Unit!8063)

(assert (=> b!130241 (= lt!200826 lt!200827)))

(assert (=> b!130241 (validate_offset_bits!1 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200831)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) lt!200825)))

(assert (=> b!130241 (= lt!200827 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5892 lt!200716) (buf!3087 (_2!5892 lt!200831)) lt!200825))))

(assert (=> b!130241 e!86326))

(declare-fun res!107945 () Bool)

(assert (=> b!130241 (=> (not res!107945) (not e!86326))))

(assert (=> b!130241 (= res!107945 (and (= (size!2729 (buf!3087 (_2!5892 lt!200716))) (size!2729 (buf!3087 (_2!5892 lt!200831)))) (bvsge lt!200825 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130241 (= lt!200825 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!130241 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!130241 (= lt!200830 (reader!0 (_2!5892 lt!200716) (_2!5892 lt!200831)))))

(declare-fun b!130242 () Bool)

(assert (=> b!130242 (= e!86324 (arrayRangesEq!132 arr!237 (_2!5895 lt!200828) #b00000000000000000000000000000000 to!404))))

(declare-fun d!41542 () Bool)

(assert (=> d!41542 e!86325))

(declare-fun res!107948 () Bool)

(assert (=> d!41542 (=> (not res!107948) (not e!86325))))

(assert (=> d!41542 (= res!107948 (= (size!2729 (buf!3087 (_2!5892 lt!200716))) (size!2729 (buf!3087 (_2!5892 lt!200831)))))))

(declare-fun choose!64 (BitStream!4722 array!6027 (_ BitVec 32) (_ BitVec 32)) tuple2!11190)

(assert (=> d!41542 (= lt!200831 (choose!64 (_2!5892 lt!200716) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41542 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2729 arr!237)))))

(assert (=> d!41542 (= (appendByteArrayLoop!0 (_2!5892 lt!200716) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!200831)))

(declare-fun b!130239 () Bool)

(declare-fun res!107947 () Bool)

(assert (=> b!130239 (=> (not res!107947) (not e!86325))))

(declare-fun lt!200823 () (_ BitVec 64))

(declare-fun lt!200824 () (_ BitVec 64))

(assert (=> b!130239 (= res!107947 (= (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200831))) (currentByte!5848 (_2!5892 lt!200831)) (currentBit!5843 (_2!5892 lt!200831))) (bvadd lt!200824 lt!200823)))))

(assert (=> b!130239 (or (not (= (bvand lt!200824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200823 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!200824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!200824 lt!200823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!200829 () (_ BitVec 64))

(assert (=> b!130239 (= lt!200823 (bvmul lt!200829 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!130239 (or (= lt!200829 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200829 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200829)))))

(assert (=> b!130239 (= lt!200829 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!130239 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!130239 (= lt!200824 (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))))))

(assert (= (and d!41542 res!107948) b!130239))

(assert (= (and b!130239 res!107947) b!130238))

(assert (= (and b!130238 res!107946) b!130241))

(assert (= (and b!130241 res!107945) b!130240))

(assert (= (and b!130241 res!107944) b!130242))

(declare-fun m!196359 () Bool)

(assert (=> b!130238 m!196359))

(declare-fun m!196361 () Bool)

(assert (=> b!130241 m!196361))

(declare-fun m!196363 () Bool)

(assert (=> b!130241 m!196363))

(declare-fun m!196365 () Bool)

(assert (=> b!130241 m!196365))

(declare-fun m!196367 () Bool)

(assert (=> b!130241 m!196367))

(declare-fun m!196369 () Bool)

(assert (=> b!130239 m!196369))

(assert (=> b!130239 m!196219))

(declare-fun m!196371 () Bool)

(assert (=> b!130240 m!196371))

(declare-fun m!196373 () Bool)

(assert (=> d!41542 m!196373))

(declare-fun m!196375 () Bool)

(assert (=> b!130242 m!196375))

(assert (=> b!130153 d!41542))

(declare-fun d!41544 () Bool)

(declare-fun e!86327 () Bool)

(assert (=> d!41544 e!86327))

(declare-fun res!107950 () Bool)

(assert (=> d!41544 (=> (not res!107950) (not e!86327))))

(declare-fun lt!200835 () (_ BitVec 64))

(declare-fun lt!200834 () (_ BitVec 64))

(declare-fun lt!200837 () (_ BitVec 64))

(assert (=> d!41544 (= res!107950 (= lt!200837 (bvsub lt!200834 lt!200835)))))

(assert (=> d!41544 (or (= (bvand lt!200834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200834 lt!200835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41544 (= lt!200835 (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5893 lt!200718)))) ((_ sign_extend 32) (currentByte!5848 (_1!5893 lt!200718))) ((_ sign_extend 32) (currentBit!5843 (_1!5893 lt!200718)))))))

(declare-fun lt!200832 () (_ BitVec 64))

(declare-fun lt!200833 () (_ BitVec 64))

(assert (=> d!41544 (= lt!200834 (bvmul lt!200832 lt!200833))))

(assert (=> d!41544 (or (= lt!200832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200833 (bvsdiv (bvmul lt!200832 lt!200833) lt!200832)))))

(assert (=> d!41544 (= lt!200833 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41544 (= lt!200832 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5893 lt!200718)))))))

(assert (=> d!41544 (= lt!200837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5848 (_1!5893 lt!200718))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5843 (_1!5893 lt!200718)))))))

(assert (=> d!41544 (invariant!0 (currentBit!5843 (_1!5893 lt!200718)) (currentByte!5848 (_1!5893 lt!200718)) (size!2729 (buf!3087 (_1!5893 lt!200718))))))

(assert (=> d!41544 (= (bitIndex!0 (size!2729 (buf!3087 (_1!5893 lt!200718))) (currentByte!5848 (_1!5893 lt!200718)) (currentBit!5843 (_1!5893 lt!200718))) lt!200837)))

(declare-fun b!130243 () Bool)

(declare-fun res!107949 () Bool)

(assert (=> b!130243 (=> (not res!107949) (not e!86327))))

(assert (=> b!130243 (= res!107949 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200837))))

(declare-fun b!130244 () Bool)

(declare-fun lt!200836 () (_ BitVec 64))

(assert (=> b!130244 (= e!86327 (bvsle lt!200837 (bvmul lt!200836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130244 (or (= lt!200836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200836)))))

(assert (=> b!130244 (= lt!200836 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5893 lt!200718)))))))

(assert (= (and d!41544 res!107950) b!130243))

(assert (= (and b!130243 res!107949) b!130244))

(declare-fun m!196377 () Bool)

(assert (=> d!41544 m!196377))

(declare-fun m!196379 () Bool)

(assert (=> d!41544 m!196379))

(assert (=> b!130153 d!41544))

(declare-fun lt!200887 () (_ BitVec 64))

(declare-fun lt!200894 () (_ BitVec 64))

(declare-fun e!86339 () Bool)

(declare-fun lt!200882 () tuple2!11194)

(declare-fun b!130264 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4722 (_ BitVec 64)) BitStream!4722)

(assert (=> b!130264 (= e!86339 (= (_1!5894 lt!200882) (withMovedBitIndex!0 (_2!5894 lt!200882) (bvsub lt!200894 lt!200887))))))

(assert (=> b!130264 (or (= (bvand lt!200894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200887 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200894 lt!200887) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130264 (= lt!200887 (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200714))) (currentByte!5848 (_2!5892 lt!200714)) (currentBit!5843 (_2!5892 lt!200714))))))

(assert (=> b!130264 (= lt!200894 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(declare-fun d!41546 () Bool)

(assert (=> d!41546 e!86339))

(declare-fun res!107968 () Bool)

(assert (=> d!41546 (=> (not res!107968) (not e!86339))))

(assert (=> d!41546 (= res!107968 (isPrefixOf!0 (_1!5894 lt!200882) (_2!5894 lt!200882)))))

(declare-fun lt!200879 () BitStream!4722)

(assert (=> d!41546 (= lt!200882 (tuple2!11195 lt!200879 (_2!5892 lt!200714)))))

(declare-fun lt!200893 () Unit!8063)

(declare-fun lt!200892 () Unit!8063)

(assert (=> d!41546 (= lt!200893 lt!200892)))

(assert (=> d!41546 (isPrefixOf!0 lt!200879 (_2!5892 lt!200714))))

(assert (=> d!41546 (= lt!200892 (lemmaIsPrefixTransitive!0 lt!200879 (_2!5892 lt!200714) (_2!5892 lt!200714)))))

(declare-fun lt!200889 () Unit!8063)

(declare-fun lt!200895 () Unit!8063)

(assert (=> d!41546 (= lt!200889 lt!200895)))

(assert (=> d!41546 (isPrefixOf!0 lt!200879 (_2!5892 lt!200714))))

(assert (=> d!41546 (= lt!200895 (lemmaIsPrefixTransitive!0 lt!200879 thiss!1634 (_2!5892 lt!200714)))))

(declare-fun lt!200888 () Unit!8063)

(declare-fun e!86338 () Unit!8063)

(assert (=> d!41546 (= lt!200888 e!86338)))

(declare-fun c!7542 () Bool)

(assert (=> d!41546 (= c!7542 (not (= (size!2729 (buf!3087 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!200884 () Unit!8063)

(declare-fun lt!200883 () Unit!8063)

(assert (=> d!41546 (= lt!200884 lt!200883)))

(assert (=> d!41546 (isPrefixOf!0 (_2!5892 lt!200714) (_2!5892 lt!200714))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4722) Unit!8063)

(assert (=> d!41546 (= lt!200883 (lemmaIsPrefixRefl!0 (_2!5892 lt!200714)))))

(declare-fun lt!200886 () Unit!8063)

(declare-fun lt!200896 () Unit!8063)

(assert (=> d!41546 (= lt!200886 lt!200896)))

(assert (=> d!41546 (= lt!200896 (lemmaIsPrefixRefl!0 (_2!5892 lt!200714)))))

(declare-fun lt!200885 () Unit!8063)

(declare-fun lt!200891 () Unit!8063)

(assert (=> d!41546 (= lt!200885 lt!200891)))

(assert (=> d!41546 (isPrefixOf!0 lt!200879 lt!200879)))

(assert (=> d!41546 (= lt!200891 (lemmaIsPrefixRefl!0 lt!200879))))

(declare-fun lt!200880 () Unit!8063)

(declare-fun lt!200878 () Unit!8063)

(assert (=> d!41546 (= lt!200880 lt!200878)))

(assert (=> d!41546 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41546 (= lt!200878 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41546 (= lt!200879 (BitStream!4723 (buf!3087 (_2!5892 lt!200714)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(assert (=> d!41546 (isPrefixOf!0 thiss!1634 (_2!5892 lt!200714))))

(assert (=> d!41546 (= (reader!0 thiss!1634 (_2!5892 lt!200714)) lt!200882)))

(declare-fun b!130265 () Bool)

(declare-fun res!107966 () Bool)

(assert (=> b!130265 (=> (not res!107966) (not e!86339))))

(assert (=> b!130265 (= res!107966 (isPrefixOf!0 (_2!5894 lt!200882) (_2!5892 lt!200714)))))

(declare-fun b!130266 () Bool)

(declare-fun Unit!8067 () Unit!8063)

(assert (=> b!130266 (= e!86338 Unit!8067)))

(declare-fun b!130267 () Bool)

(declare-fun lt!200881 () Unit!8063)

(assert (=> b!130267 (= e!86338 lt!200881)))

(declare-fun lt!200897 () (_ BitVec 64))

(assert (=> b!130267 (= lt!200897 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!200890 () (_ BitVec 64))

(assert (=> b!130267 (= lt!200890 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6027 array!6027 (_ BitVec 64) (_ BitVec 64)) Unit!8063)

(assert (=> b!130267 (= lt!200881 (arrayBitRangesEqSymmetric!0 (buf!3087 thiss!1634) (buf!3087 (_2!5892 lt!200714)) lt!200897 lt!200890))))

(assert (=> b!130267 (arrayBitRangesEq!0 (buf!3087 (_2!5892 lt!200714)) (buf!3087 thiss!1634) lt!200897 lt!200890)))

(declare-fun b!130268 () Bool)

(declare-fun res!107967 () Bool)

(assert (=> b!130268 (=> (not res!107967) (not e!86339))))

(assert (=> b!130268 (= res!107967 (isPrefixOf!0 (_1!5894 lt!200882) thiss!1634))))

(assert (= (and d!41546 c!7542) b!130267))

(assert (= (and d!41546 (not c!7542)) b!130266))

(assert (= (and d!41546 res!107968) b!130268))

(assert (= (and b!130268 res!107967) b!130265))

(assert (= (and b!130265 res!107966) b!130264))

(declare-fun m!196385 () Bool)

(assert (=> b!130268 m!196385))

(assert (=> b!130267 m!196221))

(declare-fun m!196387 () Bool)

(assert (=> b!130267 m!196387))

(declare-fun m!196389 () Bool)

(assert (=> b!130267 m!196389))

(declare-fun m!196391 () Bool)

(assert (=> b!130265 m!196391))

(declare-fun m!196393 () Bool)

(assert (=> d!41546 m!196393))

(declare-fun m!196395 () Bool)

(assert (=> d!41546 m!196395))

(declare-fun m!196397 () Bool)

(assert (=> d!41546 m!196397))

(assert (=> d!41546 m!196261))

(declare-fun m!196399 () Bool)

(assert (=> d!41546 m!196399))

(declare-fun m!196401 () Bool)

(assert (=> d!41546 m!196401))

(declare-fun m!196403 () Bool)

(assert (=> d!41546 m!196403))

(declare-fun m!196405 () Bool)

(assert (=> d!41546 m!196405))

(declare-fun m!196407 () Bool)

(assert (=> d!41546 m!196407))

(declare-fun m!196409 () Bool)

(assert (=> d!41546 m!196409))

(declare-fun m!196411 () Bool)

(assert (=> d!41546 m!196411))

(declare-fun m!196413 () Bool)

(assert (=> b!130264 m!196413))

(assert (=> b!130264 m!196223))

(assert (=> b!130264 m!196221))

(assert (=> b!130153 d!41546))

(declare-fun d!41554 () Bool)

(assert (=> d!41554 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5894 lt!200723)))) ((_ sign_extend 32) (currentByte!5848 (_1!5894 lt!200723))) ((_ sign_extend 32) (currentBit!5843 (_1!5894 lt!200723)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5894 lt!200723)))) ((_ sign_extend 32) (currentByte!5848 (_1!5894 lt!200723))) ((_ sign_extend 32) (currentBit!5843 (_1!5894 lt!200723)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10144 () Bool)

(assert (= bs!10144 d!41554))

(declare-fun m!196415 () Bool)

(assert (=> bs!10144 m!196415))

(assert (=> b!130153 d!41554))

(declare-fun d!41556 () Bool)

(assert (=> d!41556 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10145 () Bool)

(assert (= bs!10145 d!41556))

(assert (=> bs!10145 m!196349))

(assert (=> b!130153 d!41556))

(declare-fun lt!200916 () (_ BitVec 64))

(declare-fun lt!200909 () (_ BitVec 64))

(declare-fun lt!200904 () tuple2!11194)

(declare-fun b!130269 () Bool)

(declare-fun e!86341 () Bool)

(assert (=> b!130269 (= e!86341 (= (_1!5894 lt!200904) (withMovedBitIndex!0 (_2!5894 lt!200904) (bvsub lt!200916 lt!200909))))))

(assert (=> b!130269 (or (= (bvand lt!200916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200916 lt!200909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130269 (= lt!200909 (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200714))) (currentByte!5848 (_2!5892 lt!200714)) (currentBit!5843 (_2!5892 lt!200714))))))

(assert (=> b!130269 (= lt!200916 (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))))))

(declare-fun d!41558 () Bool)

(assert (=> d!41558 e!86341))

(declare-fun res!107971 () Bool)

(assert (=> d!41558 (=> (not res!107971) (not e!86341))))

(assert (=> d!41558 (= res!107971 (isPrefixOf!0 (_1!5894 lt!200904) (_2!5894 lt!200904)))))

(declare-fun lt!200901 () BitStream!4722)

(assert (=> d!41558 (= lt!200904 (tuple2!11195 lt!200901 (_2!5892 lt!200714)))))

(declare-fun lt!200915 () Unit!8063)

(declare-fun lt!200914 () Unit!8063)

(assert (=> d!41558 (= lt!200915 lt!200914)))

(assert (=> d!41558 (isPrefixOf!0 lt!200901 (_2!5892 lt!200714))))

(assert (=> d!41558 (= lt!200914 (lemmaIsPrefixTransitive!0 lt!200901 (_2!5892 lt!200714) (_2!5892 lt!200714)))))

(declare-fun lt!200911 () Unit!8063)

(declare-fun lt!200917 () Unit!8063)

(assert (=> d!41558 (= lt!200911 lt!200917)))

(assert (=> d!41558 (isPrefixOf!0 lt!200901 (_2!5892 lt!200714))))

(assert (=> d!41558 (= lt!200917 (lemmaIsPrefixTransitive!0 lt!200901 (_2!5892 lt!200716) (_2!5892 lt!200714)))))

(declare-fun lt!200910 () Unit!8063)

(declare-fun e!86340 () Unit!8063)

(assert (=> d!41558 (= lt!200910 e!86340)))

(declare-fun c!7543 () Bool)

(assert (=> d!41558 (= c!7543 (not (= (size!2729 (buf!3087 (_2!5892 lt!200716))) #b00000000000000000000000000000000)))))

(declare-fun lt!200906 () Unit!8063)

(declare-fun lt!200905 () Unit!8063)

(assert (=> d!41558 (= lt!200906 lt!200905)))

(assert (=> d!41558 (isPrefixOf!0 (_2!5892 lt!200714) (_2!5892 lt!200714))))

(assert (=> d!41558 (= lt!200905 (lemmaIsPrefixRefl!0 (_2!5892 lt!200714)))))

(declare-fun lt!200908 () Unit!8063)

(declare-fun lt!200918 () Unit!8063)

(assert (=> d!41558 (= lt!200908 lt!200918)))

(assert (=> d!41558 (= lt!200918 (lemmaIsPrefixRefl!0 (_2!5892 lt!200714)))))

(declare-fun lt!200907 () Unit!8063)

(declare-fun lt!200913 () Unit!8063)

(assert (=> d!41558 (= lt!200907 lt!200913)))

(assert (=> d!41558 (isPrefixOf!0 lt!200901 lt!200901)))

(assert (=> d!41558 (= lt!200913 (lemmaIsPrefixRefl!0 lt!200901))))

(declare-fun lt!200902 () Unit!8063)

(declare-fun lt!200900 () Unit!8063)

(assert (=> d!41558 (= lt!200902 lt!200900)))

(assert (=> d!41558 (isPrefixOf!0 (_2!5892 lt!200716) (_2!5892 lt!200716))))

(assert (=> d!41558 (= lt!200900 (lemmaIsPrefixRefl!0 (_2!5892 lt!200716)))))

(assert (=> d!41558 (= lt!200901 (BitStream!4723 (buf!3087 (_2!5892 lt!200714)) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))))))

(assert (=> d!41558 (isPrefixOf!0 (_2!5892 lt!200716) (_2!5892 lt!200714))))

(assert (=> d!41558 (= (reader!0 (_2!5892 lt!200716) (_2!5892 lt!200714)) lt!200904)))

(declare-fun b!130270 () Bool)

(declare-fun res!107969 () Bool)

(assert (=> b!130270 (=> (not res!107969) (not e!86341))))

(assert (=> b!130270 (= res!107969 (isPrefixOf!0 (_2!5894 lt!200904) (_2!5892 lt!200714)))))

(declare-fun b!130271 () Bool)

(declare-fun Unit!8068 () Unit!8063)

(assert (=> b!130271 (= e!86340 Unit!8068)))

(declare-fun b!130272 () Bool)

(declare-fun lt!200903 () Unit!8063)

(assert (=> b!130272 (= e!86340 lt!200903)))

(declare-fun lt!200919 () (_ BitVec 64))

(assert (=> b!130272 (= lt!200919 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!200912 () (_ BitVec 64))

(assert (=> b!130272 (= lt!200912 (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))))))

(assert (=> b!130272 (= lt!200903 (arrayBitRangesEqSymmetric!0 (buf!3087 (_2!5892 lt!200716)) (buf!3087 (_2!5892 lt!200714)) lt!200919 lt!200912))))

(assert (=> b!130272 (arrayBitRangesEq!0 (buf!3087 (_2!5892 lt!200714)) (buf!3087 (_2!5892 lt!200716)) lt!200919 lt!200912)))

(declare-fun b!130273 () Bool)

(declare-fun res!107970 () Bool)

(assert (=> b!130273 (=> (not res!107970) (not e!86341))))

(assert (=> b!130273 (= res!107970 (isPrefixOf!0 (_1!5894 lt!200904) (_2!5892 lt!200716)))))

(assert (= (and d!41558 c!7543) b!130272))

(assert (= (and d!41558 (not c!7543)) b!130271))

(assert (= (and d!41558 res!107971) b!130273))

(assert (= (and b!130273 res!107970) b!130270))

(assert (= (and b!130270 res!107969) b!130269))

(declare-fun m!196417 () Bool)

(assert (=> b!130273 m!196417))

(assert (=> b!130272 m!196219))

(declare-fun m!196419 () Bool)

(assert (=> b!130272 m!196419))

(declare-fun m!196421 () Bool)

(assert (=> b!130272 m!196421))

(declare-fun m!196423 () Bool)

(assert (=> b!130270 m!196423))

(declare-fun m!196425 () Bool)

(assert (=> d!41558 m!196425))

(declare-fun m!196427 () Bool)

(assert (=> d!41558 m!196427))

(declare-fun m!196429 () Bool)

(assert (=> d!41558 m!196429))

(assert (=> d!41558 m!196263))

(declare-fun m!196431 () Bool)

(assert (=> d!41558 m!196431))

(declare-fun m!196433 () Bool)

(assert (=> d!41558 m!196433))

(assert (=> d!41558 m!196403))

(declare-fun m!196435 () Bool)

(assert (=> d!41558 m!196435))

(declare-fun m!196437 () Bool)

(assert (=> d!41558 m!196437))

(assert (=> d!41558 m!196409))

(declare-fun m!196439 () Bool)

(assert (=> d!41558 m!196439))

(declare-fun m!196441 () Bool)

(assert (=> b!130269 m!196441))

(assert (=> b!130269 m!196223))

(assert (=> b!130269 m!196219))

(assert (=> b!130153 d!41558))

(declare-fun d!41560 () Bool)

(assert (=> d!41560 (isPrefixOf!0 thiss!1634 (_2!5892 lt!200714))))

(declare-fun lt!200950 () Unit!8063)

(declare-fun choose!30 (BitStream!4722 BitStream!4722 BitStream!4722) Unit!8063)

(assert (=> d!41560 (= lt!200950 (choose!30 thiss!1634 (_2!5892 lt!200716) (_2!5892 lt!200714)))))

(assert (=> d!41560 (isPrefixOf!0 thiss!1634 (_2!5892 lt!200716))))

(assert (=> d!41560 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5892 lt!200716) (_2!5892 lt!200714)) lt!200950)))

(declare-fun bs!10146 () Bool)

(assert (= bs!10146 d!41560))

(assert (=> bs!10146 m!196261))

(declare-fun m!196451 () Bool)

(assert (=> bs!10146 m!196451))

(assert (=> bs!10146 m!196235))

(assert (=> b!130153 d!41560))

(declare-fun d!41570 () Bool)

(declare-fun res!107982 () Bool)

(declare-fun e!86347 () Bool)

(assert (=> d!41570 (=> (not res!107982) (not e!86347))))

(assert (=> d!41570 (= res!107982 (= (size!2729 (buf!3087 thiss!1634)) (size!2729 (buf!3087 (_2!5892 lt!200714)))))))

(assert (=> d!41570 (= (isPrefixOf!0 thiss!1634 (_2!5892 lt!200714)) e!86347)))

(declare-fun b!130284 () Bool)

(declare-fun res!107983 () Bool)

(assert (=> b!130284 (=> (not res!107983) (not e!86347))))

(assert (=> b!130284 (= res!107983 (bvsle (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)) (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200714))) (currentByte!5848 (_2!5892 lt!200714)) (currentBit!5843 (_2!5892 lt!200714)))))))

(declare-fun b!130285 () Bool)

(declare-fun e!86348 () Bool)

(assert (=> b!130285 (= e!86347 e!86348)))

(declare-fun res!107984 () Bool)

(assert (=> b!130285 (=> res!107984 e!86348)))

(assert (=> b!130285 (= res!107984 (= (size!2729 (buf!3087 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!130286 () Bool)

(assert (=> b!130286 (= e!86348 (arrayBitRangesEq!0 (buf!3087 thiss!1634) (buf!3087 (_2!5892 lt!200714)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634))))))

(assert (= (and d!41570 res!107982) b!130284))

(assert (= (and b!130284 res!107983) b!130285))

(assert (= (and b!130285 (not res!107984)) b!130286))

(assert (=> b!130284 m!196221))

(assert (=> b!130284 m!196223))

(assert (=> b!130286 m!196221))

(assert (=> b!130286 m!196221))

(declare-fun m!196453 () Bool)

(assert (=> b!130286 m!196453))

(assert (=> b!130153 d!41570))

(declare-fun d!41572 () Bool)

(declare-fun e!86349 () Bool)

(assert (=> d!41572 e!86349))

(declare-fun res!107986 () Bool)

(assert (=> d!41572 (=> (not res!107986) (not e!86349))))

(declare-fun lt!200956 () (_ BitVec 64))

(declare-fun lt!200953 () (_ BitVec 64))

(declare-fun lt!200954 () (_ BitVec 64))

(assert (=> d!41572 (= res!107986 (= lt!200956 (bvsub lt!200953 lt!200954)))))

(assert (=> d!41572 (or (= (bvand lt!200953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!200953 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!200953 lt!200954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41572 (= lt!200954 (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5893 lt!200713)))) ((_ sign_extend 32) (currentByte!5848 (_1!5893 lt!200713))) ((_ sign_extend 32) (currentBit!5843 (_1!5893 lt!200713)))))))

(declare-fun lt!200951 () (_ BitVec 64))

(declare-fun lt!200952 () (_ BitVec 64))

(assert (=> d!41572 (= lt!200953 (bvmul lt!200951 lt!200952))))

(assert (=> d!41572 (or (= lt!200951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!200952 (bvsdiv (bvmul lt!200951 lt!200952) lt!200951)))))

(assert (=> d!41572 (= lt!200952 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41572 (= lt!200951 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5893 lt!200713)))))))

(assert (=> d!41572 (= lt!200956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5848 (_1!5893 lt!200713))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5843 (_1!5893 lt!200713)))))))

(assert (=> d!41572 (invariant!0 (currentBit!5843 (_1!5893 lt!200713)) (currentByte!5848 (_1!5893 lt!200713)) (size!2729 (buf!3087 (_1!5893 lt!200713))))))

(assert (=> d!41572 (= (bitIndex!0 (size!2729 (buf!3087 (_1!5893 lt!200713))) (currentByte!5848 (_1!5893 lt!200713)) (currentBit!5843 (_1!5893 lt!200713))) lt!200956)))

(declare-fun b!130287 () Bool)

(declare-fun res!107985 () Bool)

(assert (=> b!130287 (=> (not res!107985) (not e!86349))))

(assert (=> b!130287 (= res!107985 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!200956))))

(declare-fun b!130288 () Bool)

(declare-fun lt!200955 () (_ BitVec 64))

(assert (=> b!130288 (= e!86349 (bvsle lt!200956 (bvmul lt!200955 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!130288 (or (= lt!200955 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!200955 #b0000000000000000000000000000000000000000000000000000000000001000) lt!200955)))))

(assert (=> b!130288 (= lt!200955 ((_ sign_extend 32) (size!2729 (buf!3087 (_1!5893 lt!200713)))))))

(assert (= (and d!41572 res!107986) b!130287))

(assert (= (and b!130287 res!107985) b!130288))

(declare-fun m!196455 () Bool)

(assert (=> d!41572 m!196455))

(declare-fun m!196457 () Bool)

(assert (=> d!41572 m!196457))

(assert (=> b!130153 d!41572))

(declare-fun d!41578 () Bool)

(declare-fun lt!200957 () tuple2!11206)

(assert (=> d!41578 (= lt!200957 (readByte!0 (BitStream!4723 (buf!3087 (_2!5892 lt!200714)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634))))))

(assert (=> d!41578 (= (readBytePure!0 (BitStream!4723 (buf!3087 (_2!5892 lt!200714)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634))) (tuple2!11193 (_2!5900 lt!200957) (_1!5900 lt!200957)))))

(declare-fun bs!10147 () Bool)

(assert (= bs!10147 d!41578))

(declare-fun m!196459 () Bool)

(assert (=> bs!10147 m!196459))

(assert (=> b!130153 d!41578))

(declare-fun d!41580 () Bool)

(declare-fun e!86365 () Bool)

(assert (=> d!41580 e!86365))

(declare-fun res!108010 () Bool)

(assert (=> d!41580 (=> (not res!108010) (not e!86365))))

(declare-fun lt!200999 () tuple2!11190)

(assert (=> d!41580 (= res!108010 (= (size!2729 (buf!3087 thiss!1634)) (size!2729 (buf!3087 (_2!5892 lt!200999)))))))

(declare-fun choose!6 (BitStream!4722 (_ BitVec 8)) tuple2!11190)

(assert (=> d!41580 (= lt!200999 (choose!6 thiss!1634 (select (arr!3346 arr!237) from!447)))))

(assert (=> d!41580 (validate_offset_byte!0 ((_ sign_extend 32) (size!2729 (buf!3087 thiss!1634))) ((_ sign_extend 32) (currentByte!5848 thiss!1634)) ((_ sign_extend 32) (currentBit!5843 thiss!1634)))))

(assert (=> d!41580 (= (appendByte!0 thiss!1634 (select (arr!3346 arr!237) from!447)) lt!200999)))

(declare-fun b!130311 () Bool)

(declare-fun res!108009 () Bool)

(assert (=> b!130311 (=> (not res!108009) (not e!86365))))

(declare-fun lt!200998 () (_ BitVec 64))

(declare-fun lt!200995 () (_ BitVec 64))

(assert (=> b!130311 (= res!108009 (= (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200999))) (currentByte!5848 (_2!5892 lt!200999)) (currentBit!5843 (_2!5892 lt!200999))) (bvadd lt!200995 lt!200998)))))

(assert (=> b!130311 (or (not (= (bvand lt!200995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!200998 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!200995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!200995 lt!200998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130311 (= lt!200998 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!130311 (= lt!200995 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(declare-fun b!130312 () Bool)

(declare-fun res!108011 () Bool)

(assert (=> b!130312 (=> (not res!108011) (not e!86365))))

(assert (=> b!130312 (= res!108011 (isPrefixOf!0 thiss!1634 (_2!5892 lt!200999)))))

(declare-fun b!130313 () Bool)

(declare-fun lt!200997 () tuple2!11194)

(declare-fun lt!200996 () tuple2!11192)

(assert (=> b!130313 (= e!86365 (and (= (_2!5893 lt!200996) (select (arr!3346 arr!237) from!447)) (= (_1!5893 lt!200996) (_2!5894 lt!200997))))))

(assert (=> b!130313 (= lt!200996 (readBytePure!0 (_1!5894 lt!200997)))))

(assert (=> b!130313 (= lt!200997 (reader!0 thiss!1634 (_2!5892 lt!200999)))))

(assert (= (and d!41580 res!108010) b!130311))

(assert (= (and b!130311 res!108009) b!130312))

(assert (= (and b!130312 res!108011) b!130313))

(assert (=> d!41580 m!196225))

(declare-fun m!196485 () Bool)

(assert (=> d!41580 m!196485))

(declare-fun m!196487 () Bool)

(assert (=> d!41580 m!196487))

(declare-fun m!196489 () Bool)

(assert (=> b!130311 m!196489))

(assert (=> b!130311 m!196221))

(declare-fun m!196491 () Bool)

(assert (=> b!130312 m!196491))

(declare-fun m!196493 () Bool)

(assert (=> b!130313 m!196493))

(declare-fun m!196495 () Bool)

(assert (=> b!130313 m!196495))

(assert (=> b!130153 d!41580))

(declare-fun d!41605 () Bool)

(declare-fun e!86375 () Bool)

(assert (=> d!41605 e!86375))

(declare-fun res!108023 () Bool)

(assert (=> d!41605 (=> (not res!108023) (not e!86375))))

(assert (=> d!41605 (= res!108023 (and (or (let ((rhs!3073 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3073 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3073) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!41606 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!41606 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!41606 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3072 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3072 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3072) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!201059 () Unit!8063)

(declare-fun choose!57 (BitStream!4722 BitStream!4722 (_ BitVec 64) (_ BitVec 32)) Unit!8063)

(assert (=> d!41605 (= lt!201059 (choose!57 thiss!1634 (_2!5892 lt!200716) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!41605 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5892 lt!200716) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!201059)))

(declare-fun lt!201061 () (_ BitVec 32))

(declare-fun b!130329 () Bool)

(assert (=> b!130329 (= e!86375 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200716)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) (bvsub (bvsub to!404 from!447) lt!201061)))))

(assert (=> b!130329 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!201061 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!201061) #b10000000000000000000000000000000)))))

(declare-fun lt!201060 () (_ BitVec 64))

(assert (=> b!130329 (= lt!201061 ((_ extract 31 0) lt!201060))))

(assert (=> b!130329 (and (bvslt lt!201060 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!201060 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!130329 (= lt!201060 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!41605 res!108023) b!130329))

(declare-fun m!196507 () Bool)

(assert (=> d!41605 m!196507))

(declare-fun m!196509 () Bool)

(assert (=> b!130329 m!196509))

(assert (=> b!130153 d!41605))

(declare-fun d!41612 () Bool)

(declare-fun e!86380 () Bool)

(assert (=> d!41612 e!86380))

(declare-fun res!108029 () Bool)

(assert (=> d!41612 (=> (not res!108029) (not e!86380))))

(declare-fun lt!201093 () tuple2!11192)

(declare-fun lt!201095 () tuple2!11192)

(assert (=> d!41612 (= res!108029 (= (bitIndex!0 (size!2729 (buf!3087 (_1!5893 lt!201093))) (currentByte!5848 (_1!5893 lt!201093)) (currentBit!5843 (_1!5893 lt!201093))) (bitIndex!0 (size!2729 (buf!3087 (_1!5893 lt!201095))) (currentByte!5848 (_1!5893 lt!201095)) (currentBit!5843 (_1!5893 lt!201095)))))))

(declare-fun lt!201094 () BitStream!4722)

(declare-fun lt!201096 () Unit!8063)

(declare-fun choose!14 (BitStream!4722 BitStream!4722 BitStream!4722 tuple2!11192 tuple2!11192 BitStream!4722 (_ BitVec 8) tuple2!11192 tuple2!11192 BitStream!4722 (_ BitVec 8)) Unit!8063)

(assert (=> d!41612 (= lt!201096 (choose!14 lt!200710 (_2!5892 lt!200714) lt!201094 lt!201093 (tuple2!11193 (_1!5893 lt!201093) (_2!5893 lt!201093)) (_1!5893 lt!201093) (_2!5893 lt!201093) lt!201095 (tuple2!11193 (_1!5893 lt!201095) (_2!5893 lt!201095)) (_1!5893 lt!201095) (_2!5893 lt!201095)))))

(assert (=> d!41612 (= lt!201095 (readBytePure!0 lt!201094))))

(assert (=> d!41612 (= lt!201093 (readBytePure!0 lt!200710))))

(assert (=> d!41612 (= lt!201094 (BitStream!4723 (buf!3087 (_2!5892 lt!200714)) (currentByte!5848 lt!200710) (currentBit!5843 lt!200710)))))

(assert (=> d!41612 (= (readBytePrefixLemma!0 lt!200710 (_2!5892 lt!200714)) lt!201096)))

(declare-fun b!130337 () Bool)

(assert (=> b!130337 (= e!86380 (= (_2!5893 lt!201093) (_2!5893 lt!201095)))))

(assert (= (and d!41612 res!108029) b!130337))

(declare-fun m!196543 () Bool)

(assert (=> d!41612 m!196543))

(declare-fun m!196545 () Bool)

(assert (=> d!41612 m!196545))

(assert (=> d!41612 m!196249))

(declare-fun m!196547 () Bool)

(assert (=> d!41612 m!196547))

(declare-fun m!196549 () Bool)

(assert (=> d!41612 m!196549))

(assert (=> b!130153 d!41612))

(declare-fun d!41618 () Bool)

(declare-fun lt!201097 () tuple2!11206)

(assert (=> d!41618 (= lt!201097 (readByte!0 (_1!5894 lt!200720)))))

(assert (=> d!41618 (= (readBytePure!0 (_1!5894 lt!200720)) (tuple2!11193 (_2!5900 lt!201097) (_1!5900 lt!201097)))))

(declare-fun bs!10154 () Bool)

(assert (= bs!10154 d!41618))

(declare-fun m!196551 () Bool)

(assert (=> bs!10154 m!196551))

(assert (=> b!130154 d!41618))

(declare-fun lt!201114 () (_ BitVec 64))

(declare-fun lt!201107 () (_ BitVec 64))

(declare-fun lt!201102 () tuple2!11194)

(declare-fun e!86382 () Bool)

(declare-fun b!130338 () Bool)

(assert (=> b!130338 (= e!86382 (= (_1!5894 lt!201102) (withMovedBitIndex!0 (_2!5894 lt!201102) (bvsub lt!201114 lt!201107))))))

(assert (=> b!130338 (or (= (bvand lt!201114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!201107 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!201114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!201114 lt!201107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!130338 (= lt!201107 (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))))))

(assert (=> b!130338 (= lt!201114 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(declare-fun d!41620 () Bool)

(assert (=> d!41620 e!86382))

(declare-fun res!108032 () Bool)

(assert (=> d!41620 (=> (not res!108032) (not e!86382))))

(assert (=> d!41620 (= res!108032 (isPrefixOf!0 (_1!5894 lt!201102) (_2!5894 lt!201102)))))

(declare-fun lt!201099 () BitStream!4722)

(assert (=> d!41620 (= lt!201102 (tuple2!11195 lt!201099 (_2!5892 lt!200716)))))

(declare-fun lt!201113 () Unit!8063)

(declare-fun lt!201112 () Unit!8063)

(assert (=> d!41620 (= lt!201113 lt!201112)))

(assert (=> d!41620 (isPrefixOf!0 lt!201099 (_2!5892 lt!200716))))

(assert (=> d!41620 (= lt!201112 (lemmaIsPrefixTransitive!0 lt!201099 (_2!5892 lt!200716) (_2!5892 lt!200716)))))

(declare-fun lt!201109 () Unit!8063)

(declare-fun lt!201115 () Unit!8063)

(assert (=> d!41620 (= lt!201109 lt!201115)))

(assert (=> d!41620 (isPrefixOf!0 lt!201099 (_2!5892 lt!200716))))

(assert (=> d!41620 (= lt!201115 (lemmaIsPrefixTransitive!0 lt!201099 thiss!1634 (_2!5892 lt!200716)))))

(declare-fun lt!201108 () Unit!8063)

(declare-fun e!86381 () Unit!8063)

(assert (=> d!41620 (= lt!201108 e!86381)))

(declare-fun c!7547 () Bool)

(assert (=> d!41620 (= c!7547 (not (= (size!2729 (buf!3087 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!201104 () Unit!8063)

(declare-fun lt!201103 () Unit!8063)

(assert (=> d!41620 (= lt!201104 lt!201103)))

(assert (=> d!41620 (isPrefixOf!0 (_2!5892 lt!200716) (_2!5892 lt!200716))))

(assert (=> d!41620 (= lt!201103 (lemmaIsPrefixRefl!0 (_2!5892 lt!200716)))))

(declare-fun lt!201106 () Unit!8063)

(declare-fun lt!201116 () Unit!8063)

(assert (=> d!41620 (= lt!201106 lt!201116)))

(assert (=> d!41620 (= lt!201116 (lemmaIsPrefixRefl!0 (_2!5892 lt!200716)))))

(declare-fun lt!201105 () Unit!8063)

(declare-fun lt!201111 () Unit!8063)

(assert (=> d!41620 (= lt!201105 lt!201111)))

(assert (=> d!41620 (isPrefixOf!0 lt!201099 lt!201099)))

(assert (=> d!41620 (= lt!201111 (lemmaIsPrefixRefl!0 lt!201099))))

(declare-fun lt!201100 () Unit!8063)

(declare-fun lt!201098 () Unit!8063)

(assert (=> d!41620 (= lt!201100 lt!201098)))

(assert (=> d!41620 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41620 (= lt!201098 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41620 (= lt!201099 (BitStream!4723 (buf!3087 (_2!5892 lt!200716)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(assert (=> d!41620 (isPrefixOf!0 thiss!1634 (_2!5892 lt!200716))))

(assert (=> d!41620 (= (reader!0 thiss!1634 (_2!5892 lt!200716)) lt!201102)))

(declare-fun b!130339 () Bool)

(declare-fun res!108030 () Bool)

(assert (=> b!130339 (=> (not res!108030) (not e!86382))))

(assert (=> b!130339 (= res!108030 (isPrefixOf!0 (_2!5894 lt!201102) (_2!5892 lt!200716)))))

(declare-fun b!130340 () Bool)

(declare-fun Unit!8069 () Unit!8063)

(assert (=> b!130340 (= e!86381 Unit!8069)))

(declare-fun b!130341 () Bool)

(declare-fun lt!201101 () Unit!8063)

(assert (=> b!130341 (= e!86381 lt!201101)))

(declare-fun lt!201117 () (_ BitVec 64))

(assert (=> b!130341 (= lt!201117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!201110 () (_ BitVec 64))

(assert (=> b!130341 (= lt!201110 (bitIndex!0 (size!2729 (buf!3087 thiss!1634)) (currentByte!5848 thiss!1634) (currentBit!5843 thiss!1634)))))

(assert (=> b!130341 (= lt!201101 (arrayBitRangesEqSymmetric!0 (buf!3087 thiss!1634) (buf!3087 (_2!5892 lt!200716)) lt!201117 lt!201110))))

(assert (=> b!130341 (arrayBitRangesEq!0 (buf!3087 (_2!5892 lt!200716)) (buf!3087 thiss!1634) lt!201117 lt!201110)))

(declare-fun b!130342 () Bool)

(declare-fun res!108031 () Bool)

(assert (=> b!130342 (=> (not res!108031) (not e!86382))))

(assert (=> b!130342 (= res!108031 (isPrefixOf!0 (_1!5894 lt!201102) thiss!1634))))

(assert (= (and d!41620 c!7547) b!130341))

(assert (= (and d!41620 (not c!7547)) b!130340))

(assert (= (and d!41620 res!108032) b!130342))

(assert (= (and b!130342 res!108031) b!130339))

(assert (= (and b!130339 res!108030) b!130338))

(declare-fun m!196553 () Bool)

(assert (=> b!130342 m!196553))

(assert (=> b!130341 m!196221))

(declare-fun m!196555 () Bool)

(assert (=> b!130341 m!196555))

(declare-fun m!196557 () Bool)

(assert (=> b!130341 m!196557))

(declare-fun m!196559 () Bool)

(assert (=> b!130339 m!196559))

(declare-fun m!196561 () Bool)

(assert (=> d!41620 m!196561))

(assert (=> d!41620 m!196395))

(declare-fun m!196563 () Bool)

(assert (=> d!41620 m!196563))

(assert (=> d!41620 m!196235))

(declare-fun m!196565 () Bool)

(assert (=> d!41620 m!196565))

(declare-fun m!196567 () Bool)

(assert (=> d!41620 m!196567))

(assert (=> d!41620 m!196427))

(declare-fun m!196569 () Bool)

(assert (=> d!41620 m!196569))

(declare-fun m!196571 () Bool)

(assert (=> d!41620 m!196571))

(assert (=> d!41620 m!196439))

(assert (=> d!41620 m!196411))

(declare-fun m!196573 () Bool)

(assert (=> b!130338 m!196573))

(assert (=> b!130338 m!196219))

(assert (=> b!130338 m!196221))

(assert (=> b!130154 d!41620))

(declare-datatypes ((tuple3!484 0))(
  ( (tuple3!485 (_1!5901 Unit!8063) (_2!5901 BitStream!4722) (_3!297 array!6027)) )
))
(declare-fun lt!201120 () tuple3!484)

(declare-fun d!41622 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4722 array!6027 (_ BitVec 32) (_ BitVec 32)) tuple3!484)

(assert (=> d!41622 (= lt!201120 (readByteArrayLoop!0 (_1!5894 lt!200709) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41622 (= (readByteArrayLoopPure!0 (_1!5894 lt!200709) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11197 (_2!5901 lt!201120) (_3!297 lt!201120)))))

(declare-fun bs!10155 () Bool)

(assert (= bs!10155 d!41622))

(declare-fun m!196575 () Bool)

(assert (=> bs!10155 m!196575))

(assert (=> b!130156 d!41622))

(declare-fun d!41624 () Bool)

(assert (=> d!41624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200714)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) lt!200711) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200714)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716)))) lt!200711))))

(declare-fun bs!10156 () Bool)

(assert (= bs!10156 d!41624))

(declare-fun m!196577 () Bool)

(assert (=> bs!10156 m!196577))

(assert (=> b!130156 d!41624))

(declare-fun d!41626 () Bool)

(assert (=> d!41626 (validate_offset_bits!1 ((_ sign_extend 32) (size!2729 (buf!3087 (_2!5892 lt!200714)))) ((_ sign_extend 32) (currentByte!5848 (_2!5892 lt!200716))) ((_ sign_extend 32) (currentBit!5843 (_2!5892 lt!200716))) lt!200711)))

(declare-fun lt!201123 () Unit!8063)

(declare-fun choose!9 (BitStream!4722 array!6027 (_ BitVec 64) BitStream!4722) Unit!8063)

(assert (=> d!41626 (= lt!201123 (choose!9 (_2!5892 lt!200716) (buf!3087 (_2!5892 lt!200714)) lt!200711 (BitStream!4723 (buf!3087 (_2!5892 lt!200714)) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716)))))))

(assert (=> d!41626 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5892 lt!200716) (buf!3087 (_2!5892 lt!200714)) lt!200711) lt!201123)))

(declare-fun bs!10157 () Bool)

(assert (= bs!10157 d!41626))

(assert (=> bs!10157 m!196213))

(declare-fun m!196579 () Bool)

(assert (=> bs!10157 m!196579))

(assert (=> b!130156 d!41626))

(assert (=> b!130156 d!41558))

(declare-fun d!41628 () Bool)

(declare-fun res!108033 () Bool)

(declare-fun e!86383 () Bool)

(assert (=> d!41628 (=> (not res!108033) (not e!86383))))

(assert (=> d!41628 (= res!108033 (= (size!2729 (buf!3087 (_2!5892 lt!200716))) (size!2729 (buf!3087 (_2!5892 lt!200714)))))))

(assert (=> d!41628 (= (isPrefixOf!0 (_2!5892 lt!200716) (_2!5892 lt!200714)) e!86383)))

(declare-fun b!130343 () Bool)

(declare-fun res!108034 () Bool)

(assert (=> b!130343 (=> (not res!108034) (not e!86383))))

(assert (=> b!130343 (= res!108034 (bvsle (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716))) (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200714))) (currentByte!5848 (_2!5892 lt!200714)) (currentBit!5843 (_2!5892 lt!200714)))))))

(declare-fun b!130344 () Bool)

(declare-fun e!86384 () Bool)

(assert (=> b!130344 (= e!86383 e!86384)))

(declare-fun res!108035 () Bool)

(assert (=> b!130344 (=> res!108035 e!86384)))

(assert (=> b!130344 (= res!108035 (= (size!2729 (buf!3087 (_2!5892 lt!200716))) #b00000000000000000000000000000000))))

(declare-fun b!130345 () Bool)

(assert (=> b!130345 (= e!86384 (arrayBitRangesEq!0 (buf!3087 (_2!5892 lt!200716)) (buf!3087 (_2!5892 lt!200714)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2729 (buf!3087 (_2!5892 lt!200716))) (currentByte!5848 (_2!5892 lt!200716)) (currentBit!5843 (_2!5892 lt!200716)))))))

(assert (= (and d!41628 res!108033) b!130343))

(assert (= (and b!130343 res!108034) b!130344))

(assert (= (and b!130344 (not res!108035)) b!130345))

(assert (=> b!130343 m!196219))

(assert (=> b!130343 m!196223))

(assert (=> b!130345 m!196219))

(assert (=> b!130345 m!196219))

(declare-fun m!196581 () Bool)

(assert (=> b!130345 m!196581))

(assert (=> b!130155 d!41628))

(check-sat (not b!130339) (not d!41530) (not d!41620) (not b!130208) (not b!130345) (not d!41546) (not d!41554) (not b!130242) (not d!41622) (not d!41605) (not b!130268) (not b!130342) (not d!41580) (not b!130269) (not b!130241) (not d!41542) (not b!130284) (not b!130265) (not b!130239) (not b!130223) (not d!41522) (not b!130272) (not b!130270) (not d!41612) (not b!130238) (not b!130329) (not b!130343) (not b!130240) (not b!130264) (not b!130286) (not d!41534) (not d!41578) (not b!130225) (not d!41558) (not d!41540) (not d!41556) (not d!41536) (not d!41626) (not b!130313) (not d!41624) (not b!130338) (not b!130267) (not d!41544) (not d!41560) (not d!41572) (not b!130341) (not b!130273) (not b!130312) (not d!41520) (not b!130311) (not d!41618))
(check-sat)
