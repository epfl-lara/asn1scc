; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19916 () Bool)

(assert start!19916)

(declare-fun b!99207 () Bool)

(declare-fun e!64932 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!99207 (= e!64932 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun e!64935 () Bool)

(assert (=> b!99207 e!64935))

(declare-fun res!81365 () Bool)

(assert (=> b!99207 (=> (not res!81365) (not e!64935))))

(declare-datatypes ((array!4666 0))(
  ( (array!4667 (arr!2723 (Array (_ BitVec 32) (_ BitVec 8))) (size!2130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3734 0))(
  ( (BitStream!3735 (buf!2487 array!4666) (currentByte!4927 (_ BitVec 32)) (currentBit!4922 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3734)

(declare-datatypes ((Unit!6087 0))(
  ( (Unit!6088) )
))
(declare-datatypes ((tuple2!7980 0))(
  ( (tuple2!7981 (_1!4245 Unit!6087) (_2!4245 BitStream!3734)) )
))
(declare-fun lt!144093 () tuple2!7980)

(assert (=> b!99207 (= res!81365 (= (size!2130 (buf!2487 thiss!1305)) (size!2130 (buf!2487 (_2!4245 lt!144093)))))))

(declare-fun lt!144096 () Bool)

(declare-fun appendBit!0 (BitStream!3734 Bool) tuple2!7980)

(assert (=> b!99207 (= lt!144093 (appendBit!0 thiss!1305 lt!144096))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!99207 (= lt!144096 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99208 () Bool)

(declare-fun res!81361 () Bool)

(assert (=> b!99208 (=> (not res!81361) (not e!64932))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99208 (= res!81361 (validate_offset_bits!1 ((_ sign_extend 32) (size!2130 (buf!2487 thiss!1305))) ((_ sign_extend 32) (currentByte!4927 thiss!1305)) ((_ sign_extend 32) (currentBit!4922 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99209 () Bool)

(declare-fun res!81362 () Bool)

(assert (=> b!99209 (=> (not res!81362) (not e!64932))))

(assert (=> b!99209 (= res!81362 (bvslt i!615 nBits!396))))

(declare-fun res!81367 () Bool)

(assert (=> start!19916 (=> (not res!81367) (not e!64932))))

(assert (=> start!19916 (= res!81367 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!19916 e!64932))

(assert (=> start!19916 true))

(declare-fun e!64934 () Bool)

(declare-fun inv!12 (BitStream!3734) Bool)

(assert (=> start!19916 (and (inv!12 thiss!1305) e!64934)))

(declare-fun b!99210 () Bool)

(declare-fun e!64930 () Bool)

(assert (=> b!99210 (= e!64935 e!64930)))

(declare-fun res!81363 () Bool)

(assert (=> b!99210 (=> (not res!81363) (not e!64930))))

(declare-fun lt!144097 () (_ BitVec 64))

(declare-fun lt!144095 () (_ BitVec 64))

(assert (=> b!99210 (= res!81363 (= lt!144097 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144095)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99210 (= lt!144097 (bitIndex!0 (size!2130 (buf!2487 (_2!4245 lt!144093))) (currentByte!4927 (_2!4245 lt!144093)) (currentBit!4922 (_2!4245 lt!144093))))))

(assert (=> b!99210 (= lt!144095 (bitIndex!0 (size!2130 (buf!2487 thiss!1305)) (currentByte!4927 thiss!1305) (currentBit!4922 thiss!1305)))))

(declare-fun b!99211 () Bool)

(declare-fun array_inv!1932 (array!4666) Bool)

(assert (=> b!99211 (= e!64934 (array_inv!1932 (buf!2487 thiss!1305)))))

(declare-fun b!99212 () Bool)

(declare-fun e!64933 () Bool)

(declare-datatypes ((tuple2!7982 0))(
  ( (tuple2!7983 (_1!4246 BitStream!3734) (_2!4246 Bool)) )
))
(declare-fun lt!144094 () tuple2!7982)

(assert (=> b!99212 (= e!64933 (= (bitIndex!0 (size!2130 (buf!2487 (_1!4246 lt!144094))) (currentByte!4927 (_1!4246 lt!144094)) (currentBit!4922 (_1!4246 lt!144094))) lt!144097))))

(declare-fun b!99213 () Bool)

(declare-fun res!81366 () Bool)

(assert (=> b!99213 (=> (not res!81366) (not e!64930))))

(declare-fun isPrefixOf!0 (BitStream!3734 BitStream!3734) Bool)

(assert (=> b!99213 (= res!81366 (isPrefixOf!0 thiss!1305 (_2!4245 lt!144093)))))

(declare-fun b!99214 () Bool)

(declare-fun res!81368 () Bool)

(assert (=> b!99214 (=> (not res!81368) (not e!64932))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99214 (= res!81368 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99215 () Bool)

(assert (=> b!99215 (= e!64930 e!64933)))

(declare-fun res!81364 () Bool)

(assert (=> b!99215 (=> (not res!81364) (not e!64933))))

(assert (=> b!99215 (= res!81364 (and (= (_2!4246 lt!144094) lt!144096) (= (_1!4246 lt!144094) (_2!4245 lt!144093))))))

(declare-fun readBitPure!0 (BitStream!3734) tuple2!7982)

(declare-fun readerFrom!0 (BitStream!3734 (_ BitVec 32) (_ BitVec 32)) BitStream!3734)

(assert (=> b!99215 (= lt!144094 (readBitPure!0 (readerFrom!0 (_2!4245 lt!144093) (currentBit!4922 thiss!1305) (currentByte!4927 thiss!1305))))))

(assert (= (and start!19916 res!81367) b!99208))

(assert (= (and b!99208 res!81361) b!99214))

(assert (= (and b!99214 res!81368) b!99209))

(assert (= (and b!99209 res!81362) b!99207))

(assert (= (and b!99207 res!81365) b!99210))

(assert (= (and b!99210 res!81363) b!99213))

(assert (= (and b!99213 res!81366) b!99215))

(assert (= (and b!99215 res!81364) b!99212))

(assert (= start!19916 b!99211))

(declare-fun m!144609 () Bool)

(assert (=> b!99208 m!144609))

(declare-fun m!144611 () Bool)

(assert (=> b!99210 m!144611))

(declare-fun m!144613 () Bool)

(assert (=> b!99210 m!144613))

(declare-fun m!144615 () Bool)

(assert (=> b!99215 m!144615))

(assert (=> b!99215 m!144615))

(declare-fun m!144617 () Bool)

(assert (=> b!99215 m!144617))

(declare-fun m!144619 () Bool)

(assert (=> b!99211 m!144619))

(declare-fun m!144621 () Bool)

(assert (=> b!99207 m!144621))

(declare-fun m!144623 () Bool)

(assert (=> b!99212 m!144623))

(declare-fun m!144625 () Bool)

(assert (=> b!99213 m!144625))

(declare-fun m!144627 () Bool)

(assert (=> start!19916 m!144627))

(declare-fun m!144629 () Bool)

(assert (=> b!99214 m!144629))

(push 1)

(assert (not b!99212))

(assert (not b!99208))

(assert (not b!99210))

(assert (not b!99213))

(assert (not b!99207))

(assert (not start!19916))

(assert (not b!99211))

(assert (not b!99215))

(assert (not b!99214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

