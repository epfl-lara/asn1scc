; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25666 () Bool)

(assert start!25666)

(declare-fun b!130753 () Bool)

(declare-fun res!108420 () Bool)

(declare-fun e!86660 () Bool)

(assert (=> b!130753 (=> (not res!108420) (not e!86660))))

(declare-datatypes ((array!6046 0))(
  ( (array!6047 (arr!3360 (Array (_ BitVec 32) (_ BitVec 8))) (size!2737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4738 0))(
  ( (BitStream!4739 (buf!3098 array!6046) (currentByte!5871 (_ BitVec 32)) (currentBit!5866 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4738)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130753 (= res!108420 (invariant!0 (currentBit!5866 thiss!1634) (currentByte!5871 thiss!1634) (size!2737 (buf!3098 thiss!1634))))))

(declare-fun b!130754 () Bool)

(declare-fun res!108410 () Bool)

(assert (=> b!130754 (=> (not res!108410) (not e!86660))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!130754 (= res!108410 (bvslt from!447 to!404))))

(declare-fun res!108413 () Bool)

(assert (=> start!25666 (=> (not res!108413) (not e!86660))))

(declare-fun arr!237 () array!6046)

(assert (=> start!25666 (= res!108413 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2737 arr!237))))))

(assert (=> start!25666 e!86660))

(assert (=> start!25666 true))

(declare-fun array_inv!2526 (array!6046) Bool)

(assert (=> start!25666 (array_inv!2526 arr!237)))

(declare-fun e!86657 () Bool)

(declare-fun inv!12 (BitStream!4738) Bool)

(assert (=> start!25666 (and (inv!12 thiss!1634) e!86657)))

(declare-fun b!130755 () Bool)

(declare-fun res!108419 () Bool)

(declare-fun e!86658 () Bool)

(assert (=> b!130755 (=> (not res!108419) (not e!86658))))

(declare-datatypes ((Unit!8088 0))(
  ( (Unit!8089) )
))
(declare-datatypes ((tuple2!11260 0))(
  ( (tuple2!11261 (_1!5930 Unit!8088) (_2!5930 BitStream!4738)) )
))
(declare-fun lt!201750 () tuple2!11260)

(declare-fun lt!201763 () tuple2!11260)

(declare-fun isPrefixOf!0 (BitStream!4738 BitStream!4738) Bool)

(assert (=> b!130755 (= res!108419 (isPrefixOf!0 (_2!5930 lt!201750) (_2!5930 lt!201763)))))

(declare-fun b!130756 () Bool)

(declare-fun e!86663 () Bool)

(declare-datatypes ((tuple2!11262 0))(
  ( (tuple2!11263 (_1!5931 BitStream!4738) (_2!5931 (_ BitVec 8))) )
))
(declare-fun lt!201762 () tuple2!11262)

(declare-fun lt!201757 () tuple2!11262)

(assert (=> b!130756 (= e!86663 (= (_2!5931 lt!201762) (_2!5931 lt!201757)))))

(declare-fun e!86659 () Bool)

(declare-fun b!130757 () Bool)

(declare-datatypes ((tuple2!11264 0))(
  ( (tuple2!11265 (_1!5932 BitStream!4738) (_2!5932 array!6046)) )
))
(declare-fun lt!201758 () tuple2!11264)

(declare-fun arrayRangesEq!140 (array!6046 array!6046 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130757 (= e!86659 (not (arrayRangesEq!140 arr!237 (_2!5932 lt!201758) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130758 () Bool)

(declare-fun res!108417 () Bool)

(declare-fun e!86661 () Bool)

(assert (=> b!130758 (=> (not res!108417) (not e!86661))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130758 (= res!108417 (= (bitIndex!0 (size!2737 (buf!3098 (_2!5930 lt!201750))) (currentByte!5871 (_2!5930 lt!201750)) (currentBit!5866 (_2!5930 lt!201750))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2737 (buf!3098 thiss!1634)) (currentByte!5871 thiss!1634) (currentBit!5866 thiss!1634)))))))

(declare-fun lt!201756 () tuple2!11262)

(declare-datatypes ((tuple2!11266 0))(
  ( (tuple2!11267 (_1!5933 BitStream!4738) (_2!5933 BitStream!4738)) )
))
(declare-fun lt!201751 () tuple2!11266)

(declare-fun b!130759 () Bool)

(assert (=> b!130759 (= e!86661 (and (= (_2!5931 lt!201756) (select (arr!3360 arr!237) from!447)) (= (_1!5931 lt!201756) (_2!5933 lt!201751))))))

(declare-fun readBytePure!0 (BitStream!4738) tuple2!11262)

(assert (=> b!130759 (= lt!201756 (readBytePure!0 (_1!5933 lt!201751)))))

(declare-fun reader!0 (BitStream!4738 BitStream!4738) tuple2!11266)

(assert (=> b!130759 (= lt!201751 (reader!0 thiss!1634 (_2!5930 lt!201750)))))

(declare-fun b!130760 () Bool)

(declare-fun res!108415 () Bool)

(assert (=> b!130760 (=> (not res!108415) (not e!86661))))

(assert (=> b!130760 (= res!108415 (isPrefixOf!0 thiss!1634 (_2!5930 lt!201750)))))

(declare-fun b!130761 () Bool)

(assert (=> b!130761 (= e!86657 (array_inv!2526 (buf!3098 thiss!1634)))))

(declare-fun b!130762 () Bool)

(declare-fun res!108409 () Bool)

(assert (=> b!130762 (=> (not res!108409) (not e!86660))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130762 (= res!108409 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2737 (buf!3098 thiss!1634))) ((_ sign_extend 32) (currentByte!5871 thiss!1634)) ((_ sign_extend 32) (currentBit!5866 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!130763 () Bool)

(declare-fun e!86662 () Bool)

(assert (=> b!130763 (= e!86662 (invariant!0 (currentBit!5866 thiss!1634) (currentByte!5871 thiss!1634) (size!2737 (buf!3098 (_2!5930 lt!201750)))))))

(declare-fun b!130764 () Bool)

(assert (=> b!130764 (= e!86658 (not e!86659))))

(declare-fun res!108416 () Bool)

(assert (=> b!130764 (=> res!108416 e!86659)))

(declare-fun lt!201752 () tuple2!11266)

(assert (=> b!130764 (= res!108416 (or (not (= (size!2737 (_2!5932 lt!201758)) (size!2737 arr!237))) (not (= (_1!5932 lt!201758) (_2!5933 lt!201752)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4738 array!6046 (_ BitVec 32) (_ BitVec 32)) tuple2!11264)

(assert (=> b!130764 (= lt!201758 (readByteArrayLoopPure!0 (_1!5933 lt!201752) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!201764 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130764 (validate_offset_bits!1 ((_ sign_extend 32) (size!2737 (buf!3098 (_2!5930 lt!201763)))) ((_ sign_extend 32) (currentByte!5871 (_2!5930 lt!201750))) ((_ sign_extend 32) (currentBit!5866 (_2!5930 lt!201750))) lt!201764)))

(declare-fun lt!201761 () Unit!8088)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4738 array!6046 (_ BitVec 64)) Unit!8088)

(assert (=> b!130764 (= lt!201761 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5930 lt!201750) (buf!3098 (_2!5930 lt!201763)) lt!201764))))

(assert (=> b!130764 (= lt!201752 (reader!0 (_2!5930 lt!201750) (_2!5930 lt!201763)))))

(declare-fun b!130765 () Bool)

(declare-fun e!86654 () Bool)

(assert (=> b!130765 (= e!86654 e!86658)))

(declare-fun res!108421 () Bool)

(assert (=> b!130765 (=> (not res!108421) (not e!86658))))

(assert (=> b!130765 (= res!108421 (= (bitIndex!0 (size!2737 (buf!3098 (_2!5930 lt!201763))) (currentByte!5871 (_2!5930 lt!201763)) (currentBit!5866 (_2!5930 lt!201763))) (bvadd (bitIndex!0 (size!2737 (buf!3098 (_2!5930 lt!201750))) (currentByte!5871 (_2!5930 lt!201750)) (currentBit!5866 (_2!5930 lt!201750))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201764))))))

(assert (=> b!130765 (= lt!201764 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130766 () Bool)

(assert (=> b!130766 (= e!86660 (not true))))

(declare-fun lt!201759 () tuple2!11266)

(assert (=> b!130766 (= (_2!5931 (readBytePure!0 (_1!5933 lt!201759))) (select (arr!3360 arr!237) from!447))))

(declare-fun lt!201749 () tuple2!11266)

(assert (=> b!130766 (= lt!201749 (reader!0 (_2!5930 lt!201750) (_2!5930 lt!201763)))))

(assert (=> b!130766 (= lt!201759 (reader!0 thiss!1634 (_2!5930 lt!201763)))))

(assert (=> b!130766 e!86663))

(declare-fun res!108411 () Bool)

(assert (=> b!130766 (=> (not res!108411) (not e!86663))))

(assert (=> b!130766 (= res!108411 (= (bitIndex!0 (size!2737 (buf!3098 (_1!5931 lt!201762))) (currentByte!5871 (_1!5931 lt!201762)) (currentBit!5866 (_1!5931 lt!201762))) (bitIndex!0 (size!2737 (buf!3098 (_1!5931 lt!201757))) (currentByte!5871 (_1!5931 lt!201757)) (currentBit!5866 (_1!5931 lt!201757)))))))

(declare-fun lt!201754 () Unit!8088)

(declare-fun lt!201760 () BitStream!4738)

(declare-fun readBytePrefixLemma!0 (BitStream!4738 BitStream!4738) Unit!8088)

(assert (=> b!130766 (= lt!201754 (readBytePrefixLemma!0 lt!201760 (_2!5930 lt!201763)))))

(assert (=> b!130766 (= lt!201757 (readBytePure!0 (BitStream!4739 (buf!3098 (_2!5930 lt!201763)) (currentByte!5871 thiss!1634) (currentBit!5866 thiss!1634))))))

(assert (=> b!130766 (= lt!201762 (readBytePure!0 lt!201760))))

(assert (=> b!130766 (= lt!201760 (BitStream!4739 (buf!3098 (_2!5930 lt!201750)) (currentByte!5871 thiss!1634) (currentBit!5866 thiss!1634)))))

(assert (=> b!130766 e!86662))

(declare-fun res!108418 () Bool)

(assert (=> b!130766 (=> (not res!108418) (not e!86662))))

(assert (=> b!130766 (= res!108418 (isPrefixOf!0 thiss!1634 (_2!5930 lt!201763)))))

(declare-fun lt!201753 () Unit!8088)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4738 BitStream!4738 BitStream!4738) Unit!8088)

(assert (=> b!130766 (= lt!201753 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5930 lt!201750) (_2!5930 lt!201763)))))

(assert (=> b!130766 e!86654))

(declare-fun res!108414 () Bool)

(assert (=> b!130766 (=> (not res!108414) (not e!86654))))

(assert (=> b!130766 (= res!108414 (= (size!2737 (buf!3098 (_2!5930 lt!201750))) (size!2737 (buf!3098 (_2!5930 lt!201763)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4738 array!6046 (_ BitVec 32) (_ BitVec 32)) tuple2!11260)

(assert (=> b!130766 (= lt!201763 (appendByteArrayLoop!0 (_2!5930 lt!201750) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!130766 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2737 (buf!3098 (_2!5930 lt!201750)))) ((_ sign_extend 32) (currentByte!5871 (_2!5930 lt!201750))) ((_ sign_extend 32) (currentBit!5866 (_2!5930 lt!201750))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201755 () Unit!8088)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4738 BitStream!4738 (_ BitVec 64) (_ BitVec 32)) Unit!8088)

(assert (=> b!130766 (= lt!201755 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5930 lt!201750) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130766 e!86661))

(declare-fun res!108412 () Bool)

(assert (=> b!130766 (=> (not res!108412) (not e!86661))))

(assert (=> b!130766 (= res!108412 (= (size!2737 (buf!3098 thiss!1634)) (size!2737 (buf!3098 (_2!5930 lt!201750)))))))

(declare-fun appendByte!0 (BitStream!4738 (_ BitVec 8)) tuple2!11260)

(assert (=> b!130766 (= lt!201750 (appendByte!0 thiss!1634 (select (arr!3360 arr!237) from!447)))))

(assert (= (and start!25666 res!108413) b!130762))

(assert (= (and b!130762 res!108409) b!130754))

(assert (= (and b!130754 res!108410) b!130753))

(assert (= (and b!130753 res!108420) b!130766))

(assert (= (and b!130766 res!108412) b!130758))

(assert (= (and b!130758 res!108417) b!130760))

(assert (= (and b!130760 res!108415) b!130759))

(assert (= (and b!130766 res!108414) b!130765))

(assert (= (and b!130765 res!108421) b!130755))

(assert (= (and b!130755 res!108419) b!130764))

(assert (= (and b!130764 (not res!108416)) b!130757))

(assert (= (and b!130766 res!108418) b!130763))

(assert (= (and b!130766 res!108411) b!130756))

(assert (= start!25666 b!130761))

(declare-fun m!197221 () Bool)

(assert (=> b!130760 m!197221))

(declare-fun m!197223 () Bool)

(assert (=> b!130753 m!197223))

(declare-fun m!197225 () Bool)

(assert (=> b!130755 m!197225))

(declare-fun m!197227 () Bool)

(assert (=> b!130765 m!197227))

(declare-fun m!197229 () Bool)

(assert (=> b!130765 m!197229))

(assert (=> b!130758 m!197229))

(declare-fun m!197231 () Bool)

(assert (=> b!130758 m!197231))

(declare-fun m!197233 () Bool)

(assert (=> start!25666 m!197233))

(declare-fun m!197235 () Bool)

(assert (=> start!25666 m!197235))

(declare-fun m!197237 () Bool)

(assert (=> b!130763 m!197237))

(declare-fun m!197239 () Bool)

(assert (=> b!130757 m!197239))

(declare-fun m!197241 () Bool)

(assert (=> b!130762 m!197241))

(declare-fun m!197243 () Bool)

(assert (=> b!130759 m!197243))

(declare-fun m!197245 () Bool)

(assert (=> b!130759 m!197245))

(declare-fun m!197247 () Bool)

(assert (=> b!130759 m!197247))

(declare-fun m!197249 () Bool)

(assert (=> b!130764 m!197249))

(declare-fun m!197251 () Bool)

(assert (=> b!130764 m!197251))

(declare-fun m!197253 () Bool)

(assert (=> b!130764 m!197253))

(declare-fun m!197255 () Bool)

(assert (=> b!130764 m!197255))

(declare-fun m!197257 () Bool)

(assert (=> b!130766 m!197257))

(declare-fun m!197259 () Bool)

(assert (=> b!130766 m!197259))

(declare-fun m!197261 () Bool)

(assert (=> b!130766 m!197261))

(declare-fun m!197263 () Bool)

(assert (=> b!130766 m!197263))

(declare-fun m!197265 () Bool)

(assert (=> b!130766 m!197265))

(assert (=> b!130766 m!197243))

(declare-fun m!197267 () Bool)

(assert (=> b!130766 m!197267))

(declare-fun m!197269 () Bool)

(assert (=> b!130766 m!197269))

(assert (=> b!130766 m!197243))

(declare-fun m!197271 () Bool)

(assert (=> b!130766 m!197271))

(declare-fun m!197273 () Bool)

(assert (=> b!130766 m!197273))

(declare-fun m!197275 () Bool)

(assert (=> b!130766 m!197275))

(declare-fun m!197277 () Bool)

(assert (=> b!130766 m!197277))

(assert (=> b!130766 m!197255))

(declare-fun m!197279 () Bool)

(assert (=> b!130766 m!197279))

(declare-fun m!197281 () Bool)

(assert (=> b!130766 m!197281))

(declare-fun m!197283 () Bool)

(assert (=> b!130761 m!197283))

(push 1)

(assert (not b!130764))

(assert (not b!130757))

(assert (not start!25666))

(assert (not b!130761))

(assert (not b!130753))

(assert (not b!130759))

(assert (not b!130766))

(assert (not b!130758))

(assert (not b!130765))

(assert (not b!130755))

(assert (not b!130760))

(assert (not b!130762))

(assert (not b!130763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

