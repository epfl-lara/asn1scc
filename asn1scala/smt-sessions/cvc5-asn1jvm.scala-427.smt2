; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11370 () Bool)

(assert start!11370)

(declare-fun b!56254 () Bool)

(declare-fun res!46801 () Bool)

(declare-fun e!37422 () Bool)

(assert (=> b!56254 (=> res!46801 e!37422)))

(declare-datatypes ((array!2599 0))(
  ( (array!2600 (arr!1733 (Array (_ BitVec 32) (_ BitVec 8))) (size!1181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2050 0))(
  ( (BitStream!2051 (buf!1550 array!2599) (currentByte!3144 (_ BitVec 32)) (currentBit!3139 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2050)

(declare-datatypes ((Unit!3889 0))(
  ( (Unit!3890) )
))
(declare-datatypes ((tuple2!5126 0))(
  ( (tuple2!5127 (_1!2674 Unit!3889) (_2!2674 BitStream!2050)) )
))
(declare-fun lt!88297 () tuple2!5126)

(assert (=> b!56254 (= res!46801 (not (= (size!1181 (buf!1550 thiss!1379)) (size!1181 (buf!1550 (_2!2674 lt!88297))))))))

(declare-fun b!56255 () Bool)

(declare-fun e!37423 () Bool)

(assert (=> b!56255 (= e!37423 e!37422)))

(declare-fun res!46802 () Bool)

(assert (=> b!56255 (=> res!46802 e!37422)))

(declare-fun lt!88303 () tuple2!5126)

(declare-fun isPrefixOf!0 (BitStream!2050 BitStream!2050) Bool)

(assert (=> b!56255 (= res!46802 (not (isPrefixOf!0 (_2!2674 lt!88303) (_2!2674 lt!88297))))))

(assert (=> b!56255 (isPrefixOf!0 thiss!1379 (_2!2674 lt!88297))))

(declare-fun lt!88296 () Unit!3889)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2050 BitStream!2050 BitStream!2050) Unit!3889)

(assert (=> b!56255 (= lt!88296 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2674 lt!88303) (_2!2674 lt!88297)))))

(declare-fun srcBuffer!2 () array!2599)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2050 array!2599 (_ BitVec 64) (_ BitVec 64)) tuple2!5126)

(assert (=> b!56255 (= lt!88297 (appendBitsMSBFirstLoop!0 (_2!2674 lt!88303) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!37421 () Bool)

(assert (=> b!56255 e!37421))

(declare-fun res!46796 () Bool)

(assert (=> b!56255 (=> (not res!46796) (not e!37421))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56255 (= res!46796 (validate_offset_bits!1 ((_ sign_extend 32) (size!1181 (buf!1550 (_2!2674 lt!88303)))) ((_ sign_extend 32) (currentByte!3144 thiss!1379)) ((_ sign_extend 32) (currentBit!3139 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88299 () Unit!3889)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2050 array!2599 (_ BitVec 64)) Unit!3889)

(assert (=> b!56255 (= lt!88299 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1550 (_2!2674 lt!88303)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5128 0))(
  ( (tuple2!5129 (_1!2675 BitStream!2050) (_2!2675 BitStream!2050)) )
))
(declare-fun lt!88300 () tuple2!5128)

(declare-fun reader!0 (BitStream!2050 BitStream!2050) tuple2!5128)

(assert (=> b!56255 (= lt!88300 (reader!0 thiss!1379 (_2!2674 lt!88303)))))

(declare-fun b!56256 () Bool)

(declare-datatypes ((List!600 0))(
  ( (Nil!597) (Cons!596 (h!715 Bool) (t!1350 List!600)) )
))
(declare-fun head!419 (List!600) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2050 array!2599 (_ BitVec 64) (_ BitVec 64)) List!600)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2050 BitStream!2050 (_ BitVec 64)) List!600)

(assert (=> b!56256 (= e!37421 (= (head!419 (byteArrayBitContentToList!0 (_2!2674 lt!88303) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!419 (bitStreamReadBitsIntoList!0 (_2!2674 lt!88303) (_1!2675 lt!88300) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!56257 () Bool)

(declare-fun res!46799 () Bool)

(assert (=> b!56257 (=> res!46799 e!37422)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56257 (= res!46799 (not (invariant!0 (currentBit!3139 (_2!2674 lt!88297)) (currentByte!3144 (_2!2674 lt!88297)) (size!1181 (buf!1550 (_2!2674 lt!88297))))))))

(declare-fun b!56258 () Bool)

(declare-fun e!37427 () Bool)

(declare-fun array_inv!1084 (array!2599) Bool)

(assert (=> b!56258 (= e!37427 (array_inv!1084 (buf!1550 thiss!1379)))))

(declare-fun res!46803 () Bool)

(declare-fun e!37420 () Bool)

(assert (=> start!11370 (=> (not res!46803) (not e!37420))))

(assert (=> start!11370 (= res!46803 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1181 srcBuffer!2))))))))

(assert (=> start!11370 e!37420))

(assert (=> start!11370 true))

(assert (=> start!11370 (array_inv!1084 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2050) Bool)

(assert (=> start!11370 (and (inv!12 thiss!1379) e!37427)))

(declare-fun b!56259 () Bool)

(declare-fun e!37425 () Bool)

(assert (=> b!56259 (= e!37420 (not e!37425))))

(declare-fun res!46795 () Bool)

(assert (=> b!56259 (=> res!46795 e!37425)))

(assert (=> b!56259 (= res!46795 (bvsge i!635 to!314))))

(assert (=> b!56259 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88302 () Unit!3889)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2050) Unit!3889)

(assert (=> b!56259 (= lt!88302 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!88298 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56259 (= lt!88298 (bitIndex!0 (size!1181 (buf!1550 thiss!1379)) (currentByte!3144 thiss!1379) (currentBit!3139 thiss!1379)))))

(declare-fun b!56260 () Bool)

(assert (=> b!56260 (= e!37422 true)))

(assert (=> b!56260 (= (size!1181 (buf!1550 (_2!2674 lt!88297))) (size!1181 (buf!1550 thiss!1379)))))

(declare-fun b!56261 () Bool)

(declare-fun res!46797 () Bool)

(assert (=> b!56261 (=> (not res!46797) (not e!37420))))

(assert (=> b!56261 (= res!46797 (validate_offset_bits!1 ((_ sign_extend 32) (size!1181 (buf!1550 thiss!1379))) ((_ sign_extend 32) (currentByte!3144 thiss!1379)) ((_ sign_extend 32) (currentBit!3139 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!56262 () Bool)

(declare-fun res!46800 () Bool)

(assert (=> b!56262 (=> res!46800 e!37422)))

(assert (=> b!56262 (= res!46800 (not (= (bitIndex!0 (size!1181 (buf!1550 (_2!2674 lt!88297))) (currentByte!3144 (_2!2674 lt!88297)) (currentBit!3139 (_2!2674 lt!88297))) (bvsub (bvadd lt!88298 to!314) i!635))))))

(declare-fun b!56263 () Bool)

(assert (=> b!56263 (= e!37425 e!37423)))

(declare-fun res!46798 () Bool)

(assert (=> b!56263 (=> res!46798 e!37423)))

(assert (=> b!56263 (= res!46798 (not (isPrefixOf!0 thiss!1379 (_2!2674 lt!88303))))))

(assert (=> b!56263 (validate_offset_bits!1 ((_ sign_extend 32) (size!1181 (buf!1550 (_2!2674 lt!88303)))) ((_ sign_extend 32) (currentByte!3144 (_2!2674 lt!88303))) ((_ sign_extend 32) (currentBit!3139 (_2!2674 lt!88303))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88301 () Unit!3889)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2050 BitStream!2050 (_ BitVec 64) (_ BitVec 64)) Unit!3889)

(assert (=> b!56263 (= lt!88301 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2674 lt!88303) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2050 (_ BitVec 8) (_ BitVec 32)) tuple2!5126)

(assert (=> b!56263 (= lt!88303 (appendBitFromByte!0 thiss!1379 (select (arr!1733 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11370 res!46803) b!56261))

(assert (= (and b!56261 res!46797) b!56259))

(assert (= (and b!56259 (not res!46795)) b!56263))

(assert (= (and b!56263 (not res!46798)) b!56255))

(assert (= (and b!56255 res!46796) b!56256))

(assert (= (and b!56255 (not res!46802)) b!56262))

(assert (= (and b!56262 (not res!46800)) b!56257))

(assert (= (and b!56257 (not res!46799)) b!56254))

(assert (= (and b!56254 (not res!46801)) b!56260))

(assert (= start!11370 b!56258))

(declare-fun m!88651 () Bool)

(assert (=> b!56257 m!88651))

(declare-fun m!88653 () Bool)

(assert (=> b!56255 m!88653))

(declare-fun m!88655 () Bool)

(assert (=> b!56255 m!88655))

(declare-fun m!88657 () Bool)

(assert (=> b!56255 m!88657))

(declare-fun m!88659 () Bool)

(assert (=> b!56255 m!88659))

(declare-fun m!88661 () Bool)

(assert (=> b!56255 m!88661))

(declare-fun m!88663 () Bool)

(assert (=> b!56255 m!88663))

(declare-fun m!88665 () Bool)

(assert (=> b!56255 m!88665))

(declare-fun m!88667 () Bool)

(assert (=> b!56256 m!88667))

(assert (=> b!56256 m!88667))

(declare-fun m!88669 () Bool)

(assert (=> b!56256 m!88669))

(declare-fun m!88671 () Bool)

(assert (=> b!56256 m!88671))

(assert (=> b!56256 m!88671))

(declare-fun m!88673 () Bool)

(assert (=> b!56256 m!88673))

(declare-fun m!88675 () Bool)

(assert (=> b!56261 m!88675))

(declare-fun m!88677 () Bool)

(assert (=> b!56263 m!88677))

(declare-fun m!88679 () Bool)

(assert (=> b!56263 m!88679))

(assert (=> b!56263 m!88677))

(declare-fun m!88681 () Bool)

(assert (=> b!56263 m!88681))

(declare-fun m!88683 () Bool)

(assert (=> b!56263 m!88683))

(declare-fun m!88685 () Bool)

(assert (=> b!56263 m!88685))

(declare-fun m!88687 () Bool)

(assert (=> start!11370 m!88687))

(declare-fun m!88689 () Bool)

(assert (=> start!11370 m!88689))

(declare-fun m!88691 () Bool)

(assert (=> b!56259 m!88691))

(declare-fun m!88693 () Bool)

(assert (=> b!56259 m!88693))

(declare-fun m!88695 () Bool)

(assert (=> b!56259 m!88695))

(declare-fun m!88697 () Bool)

(assert (=> b!56262 m!88697))

(declare-fun m!88699 () Bool)

(assert (=> b!56258 m!88699))

(push 1)

(assert (not start!11370))

(assert (not b!56257))

(assert (not b!56256))

(assert (not b!56255))

(assert (not b!56262))

(assert (not b!56259))

(assert (not b!56263))

(assert (not b!56258))

(assert (not b!56261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

