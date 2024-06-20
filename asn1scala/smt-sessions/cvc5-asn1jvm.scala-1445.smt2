; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39620 () Bool)

(assert start!39620)

(declare-fun b!178991 () Bool)

(declare-fun e!124550 () Bool)

(declare-datatypes ((array!9635 0))(
  ( (array!9636 (arr!5179 (Array (_ BitVec 32) (_ BitVec 8))) (size!4249 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7606 0))(
  ( (BitStream!7607 (buf!4692 array!9635) (currentByte!8890 (_ BitVec 32)) (currentBit!8885 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7606)

(declare-datatypes ((Unit!12878 0))(
  ( (Unit!12879) )
))
(declare-datatypes ((tuple2!15428 0))(
  ( (tuple2!15429 (_1!8359 Unit!12878) (_2!8359 BitStream!7606)) )
))
(declare-fun lt!274535 () tuple2!15428)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178991 (= e!124550 (invariant!0 (currentBit!8885 thiss!1204) (currentByte!8890 thiss!1204) (size!4249 (buf!4692 (_2!8359 lt!274535)))))))

(declare-fun b!178992 () Bool)

(declare-fun res!148512 () Bool)

(declare-fun e!124552 () Bool)

(assert (=> b!178992 (=> res!148512 e!124552)))

(declare-fun lt!274532 () tuple2!15428)

(declare-fun isPrefixOf!0 (BitStream!7606 BitStream!7606) Bool)

(assert (=> b!178992 (= res!148512 (not (isPrefixOf!0 thiss!1204 (_2!8359 lt!274532))))))

(declare-fun b!178994 () Bool)

(declare-fun res!148505 () Bool)

(declare-fun e!124551 () Bool)

(assert (=> b!178994 (=> (not res!148505) (not e!124551))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!178994 (= res!148505 (not (= i!590 nBits!348)))))

(declare-fun b!178995 () Bool)

(declare-fun res!148510 () Bool)

(assert (=> b!178995 (=> res!148510 e!124552)))

(declare-fun lt!274531 () (_ BitVec 64))

(declare-fun lt!274534 () (_ BitVec 64))

(assert (=> b!178995 (= res!148510 (or (not (= (size!4249 (buf!4692 (_2!8359 lt!274535))) (size!4249 (buf!4692 thiss!1204)))) (not (= lt!274534 (bvsub (bvadd lt!274531 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178996 () Bool)

(declare-fun e!124546 () Bool)

(declare-fun e!124553 () Bool)

(assert (=> b!178996 (= e!124546 e!124553)))

(declare-fun res!148504 () Bool)

(assert (=> b!178996 (=> (not res!148504) (not e!124553))))

(declare-fun lt!274537 () Bool)

(declare-datatypes ((tuple2!15430 0))(
  ( (tuple2!15431 (_1!8360 BitStream!7606) (_2!8360 Bool)) )
))
(declare-fun lt!274528 () tuple2!15430)

(assert (=> b!178996 (= res!148504 (and (= (_2!8360 lt!274528) lt!274537) (= (_1!8360 lt!274528) (_2!8359 lt!274532))))))

(declare-fun readBitPure!0 (BitStream!7606) tuple2!15430)

(declare-fun readerFrom!0 (BitStream!7606 (_ BitVec 32) (_ BitVec 32)) BitStream!7606)

(assert (=> b!178996 (= lt!274528 (readBitPure!0 (readerFrom!0 (_2!8359 lt!274532) (currentBit!8885 thiss!1204) (currentByte!8890 thiss!1204))))))

(declare-fun b!178997 () Bool)

(declare-fun res!148515 () Bool)

(assert (=> b!178997 (=> res!148515 e!124552)))

(assert (=> b!178997 (= res!148515 (not (invariant!0 (currentBit!8885 (_2!8359 lt!274535)) (currentByte!8890 (_2!8359 lt!274535)) (size!4249 (buf!4692 (_2!8359 lt!274535))))))))

(declare-fun b!178998 () Bool)

(declare-fun res!148507 () Bool)

(assert (=> b!178998 (=> (not res!148507) (not e!124551))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178998 (= res!148507 (validate_offset_bits!1 ((_ sign_extend 32) (size!4249 (buf!4692 thiss!1204))) ((_ sign_extend 32) (currentByte!8890 thiss!1204)) ((_ sign_extend 32) (currentBit!8885 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178999 () Bool)

(declare-fun e!124555 () Bool)

(assert (=> b!178999 (= e!124551 (not e!124555))))

(declare-fun res!148511 () Bool)

(assert (=> b!178999 (=> res!148511 e!124555)))

(declare-fun lt!274533 () (_ BitVec 64))

(assert (=> b!178999 (= res!148511 (not (= lt!274533 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274531))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178999 (= lt!274533 (bitIndex!0 (size!4249 (buf!4692 (_2!8359 lt!274532))) (currentByte!8890 (_2!8359 lt!274532)) (currentBit!8885 (_2!8359 lt!274532))))))

(assert (=> b!178999 (= lt!274531 (bitIndex!0 (size!4249 (buf!4692 thiss!1204)) (currentByte!8890 thiss!1204) (currentBit!8885 thiss!1204)))))

(declare-fun e!124549 () Bool)

(assert (=> b!178999 e!124549))

(declare-fun res!148503 () Bool)

(assert (=> b!178999 (=> (not res!148503) (not e!124549))))

(assert (=> b!178999 (= res!148503 (= (size!4249 (buf!4692 thiss!1204)) (size!4249 (buf!4692 (_2!8359 lt!274532)))))))

(declare-fun appendBit!0 (BitStream!7606 Bool) tuple2!15428)

(assert (=> b!178999 (= lt!274532 (appendBit!0 thiss!1204 lt!274537))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178999 (= lt!274537 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179000 () Bool)

(declare-fun lt!274536 () (_ BitVec 64))

(assert (=> b!179000 (= e!124553 (= (bitIndex!0 (size!4249 (buf!4692 (_1!8360 lt!274528))) (currentByte!8890 (_1!8360 lt!274528)) (currentBit!8885 (_1!8360 lt!274528))) lt!274536))))

(declare-fun b!179001 () Bool)

(declare-fun res!148501 () Bool)

(assert (=> b!179001 (=> res!148501 e!124552)))

(assert (=> b!179001 (= res!148501 (not (isPrefixOf!0 (_2!8359 lt!274532) (_2!8359 lt!274535))))))

(declare-fun b!179002 () Bool)

(declare-fun e!124554 () Bool)

(declare-fun lt!274530 () tuple2!15430)

(declare-fun lt!274541 () tuple2!15430)

(assert (=> b!179002 (= e!124554 (= (_2!8360 lt!274530) (_2!8360 lt!274541)))))

(declare-fun b!179003 () Bool)

(declare-fun res!148513 () Bool)

(assert (=> b!179003 (=> (not res!148513) (not e!124551))))

(assert (=> b!179003 (= res!148513 (invariant!0 (currentBit!8885 thiss!1204) (currentByte!8890 thiss!1204) (size!4249 (buf!4692 thiss!1204))))))

(declare-fun res!148506 () Bool)

(assert (=> start!39620 (=> (not res!148506) (not e!124551))))

(assert (=> start!39620 (= res!148506 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39620 e!124551))

(assert (=> start!39620 true))

(declare-fun e!124547 () Bool)

(declare-fun inv!12 (BitStream!7606) Bool)

(assert (=> start!39620 (and (inv!12 thiss!1204) e!124547)))

(declare-fun b!178993 () Bool)

(assert (=> b!178993 (= e!124549 e!124546)))

(declare-fun res!148500 () Bool)

(assert (=> b!178993 (=> (not res!148500) (not e!124546))))

(declare-fun lt!274527 () (_ BitVec 64))

(assert (=> b!178993 (= res!148500 (= lt!274536 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274527)))))

(assert (=> b!178993 (= lt!274536 (bitIndex!0 (size!4249 (buf!4692 (_2!8359 lt!274532))) (currentByte!8890 (_2!8359 lt!274532)) (currentBit!8885 (_2!8359 lt!274532))))))

(assert (=> b!178993 (= lt!274527 (bitIndex!0 (size!4249 (buf!4692 thiss!1204)) (currentByte!8890 thiss!1204) (currentBit!8885 thiss!1204)))))

(declare-fun b!179004 () Bool)

(declare-fun array_inv!3990 (array!9635) Bool)

(assert (=> b!179004 (= e!124547 (array_inv!3990 (buf!4692 thiss!1204)))))

(declare-fun b!179005 () Bool)

(declare-fun res!148508 () Bool)

(assert (=> b!179005 (=> (not res!148508) (not e!124546))))

(assert (=> b!179005 (= res!148508 (isPrefixOf!0 thiss!1204 (_2!8359 lt!274532)))))

(declare-fun b!179006 () Bool)

(assert (=> b!179006 (= e!124552 true)))

(declare-datatypes ((tuple2!15432 0))(
  ( (tuple2!15433 (_1!8361 BitStream!7606) (_2!8361 BitStream!7606)) )
))
(declare-fun lt!274538 () tuple2!15432)

(declare-fun reader!0 (BitStream!7606 BitStream!7606) tuple2!15432)

(assert (=> b!179006 (= lt!274538 (reader!0 thiss!1204 (_2!8359 lt!274535)))))

(assert (=> b!179006 e!124554))

(declare-fun res!148502 () Bool)

(assert (=> b!179006 (=> (not res!148502) (not e!124554))))

(assert (=> b!179006 (= res!148502 (= (bitIndex!0 (size!4249 (buf!4692 (_1!8360 lt!274530))) (currentByte!8890 (_1!8360 lt!274530)) (currentBit!8885 (_1!8360 lt!274530))) (bitIndex!0 (size!4249 (buf!4692 (_1!8360 lt!274541))) (currentByte!8890 (_1!8360 lt!274541)) (currentBit!8885 (_1!8360 lt!274541)))))))

(declare-fun lt!274540 () Unit!12878)

(declare-fun lt!274529 () BitStream!7606)

(declare-fun readBitPrefixLemma!0 (BitStream!7606 BitStream!7606) Unit!12878)

(assert (=> b!179006 (= lt!274540 (readBitPrefixLemma!0 lt!274529 (_2!8359 lt!274535)))))

(assert (=> b!179006 (= lt!274541 (readBitPure!0 (BitStream!7607 (buf!4692 (_2!8359 lt!274535)) (currentByte!8890 thiss!1204) (currentBit!8885 thiss!1204))))))

(assert (=> b!179006 (= lt!274530 (readBitPure!0 lt!274529))))

(assert (=> b!179006 e!124550))

(declare-fun res!148514 () Bool)

(assert (=> b!179006 (=> (not res!148514) (not e!124550))))

(assert (=> b!179006 (= res!148514 (invariant!0 (currentBit!8885 thiss!1204) (currentByte!8890 thiss!1204) (size!4249 (buf!4692 (_2!8359 lt!274532)))))))

(assert (=> b!179006 (= lt!274529 (BitStream!7607 (buf!4692 (_2!8359 lt!274532)) (currentByte!8890 thiss!1204) (currentBit!8885 thiss!1204)))))

(declare-fun b!179007 () Bool)

(assert (=> b!179007 (= e!124555 e!124552)))

(declare-fun res!148509 () Bool)

(assert (=> b!179007 (=> res!148509 e!124552)))

(assert (=> b!179007 (= res!148509 (not (= lt!274534 (bvsub (bvsub (bvadd lt!274533 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179007 (= lt!274534 (bitIndex!0 (size!4249 (buf!4692 (_2!8359 lt!274535))) (currentByte!8890 (_2!8359 lt!274535)) (currentBit!8885 (_2!8359 lt!274535))))))

(assert (=> b!179007 (isPrefixOf!0 thiss!1204 (_2!8359 lt!274535))))

(declare-fun lt!274539 () Unit!12878)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7606 BitStream!7606 BitStream!7606) Unit!12878)

(assert (=> b!179007 (= lt!274539 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8359 lt!274532) (_2!8359 lt!274535)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7606 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15428)

(assert (=> b!179007 (= lt!274535 (appendBitsLSBFirstLoopTR!0 (_2!8359 lt!274532) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(assert (= (and start!39620 res!148506) b!178998))

(assert (= (and b!178998 res!148507) b!179003))

(assert (= (and b!179003 res!148513) b!178994))

(assert (= (and b!178994 res!148505) b!178999))

(assert (= (and b!178999 res!148503) b!178993))

(assert (= (and b!178993 res!148500) b!179005))

(assert (= (and b!179005 res!148508) b!178996))

(assert (= (and b!178996 res!148504) b!179000))

(assert (= (and b!178999 (not res!148511)) b!179007))

(assert (= (and b!179007 (not res!148509)) b!178997))

(assert (= (and b!178997 (not res!148515)) b!178995))

(assert (= (and b!178995 (not res!148510)) b!179001))

(assert (= (and b!179001 (not res!148501)) b!178992))

(assert (= (and b!178992 (not res!148512)) b!179006))

(assert (= (and b!179006 res!148514) b!178991))

(assert (= (and b!179006 res!148502) b!179002))

(assert (= start!39620 b!179004))

(declare-fun m!279067 () Bool)

(assert (=> start!39620 m!279067))

(declare-fun m!279069 () Bool)

(assert (=> b!178998 m!279069))

(declare-fun m!279071 () Bool)

(assert (=> b!179005 m!279071))

(declare-fun m!279073 () Bool)

(assert (=> b!178999 m!279073))

(declare-fun m!279075 () Bool)

(assert (=> b!178999 m!279075))

(declare-fun m!279077 () Bool)

(assert (=> b!178999 m!279077))

(assert (=> b!178992 m!279071))

(declare-fun m!279079 () Bool)

(assert (=> b!179003 m!279079))

(declare-fun m!279081 () Bool)

(assert (=> b!179001 m!279081))

(declare-fun m!279083 () Bool)

(assert (=> b!179006 m!279083))

(declare-fun m!279085 () Bool)

(assert (=> b!179006 m!279085))

(declare-fun m!279087 () Bool)

(assert (=> b!179006 m!279087))

(declare-fun m!279089 () Bool)

(assert (=> b!179006 m!279089))

(declare-fun m!279091 () Bool)

(assert (=> b!179006 m!279091))

(declare-fun m!279093 () Bool)

(assert (=> b!179006 m!279093))

(declare-fun m!279095 () Bool)

(assert (=> b!179006 m!279095))

(declare-fun m!279097 () Bool)

(assert (=> b!179004 m!279097))

(assert (=> b!178993 m!279073))

(assert (=> b!178993 m!279075))

(declare-fun m!279099 () Bool)

(assert (=> b!178991 m!279099))

(declare-fun m!279101 () Bool)

(assert (=> b!178997 m!279101))

(declare-fun m!279103 () Bool)

(assert (=> b!179007 m!279103))

(declare-fun m!279105 () Bool)

(assert (=> b!179007 m!279105))

(declare-fun m!279107 () Bool)

(assert (=> b!179007 m!279107))

(declare-fun m!279109 () Bool)

(assert (=> b!179007 m!279109))

(declare-fun m!279111 () Bool)

(assert (=> b!178996 m!279111))

(assert (=> b!178996 m!279111))

(declare-fun m!279113 () Bool)

(assert (=> b!178996 m!279113))

(declare-fun m!279115 () Bool)

(assert (=> b!179000 m!279115))

(push 1)

(assert (not b!178996))

(assert (not b!179003))

(assert (not b!178998))

(assert (not b!179000))

(assert (not b!179005))

(assert (not b!178991))

(assert (not b!179004))

(assert (not b!178997))

(assert (not b!179006))

(assert (not b!178999))

(assert (not b!179001))

(assert (not b!179007))

(assert (not b!178992))

(assert (not start!39620))

(assert (not b!178993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

