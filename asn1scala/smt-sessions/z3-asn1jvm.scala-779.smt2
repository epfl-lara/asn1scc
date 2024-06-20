; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22376 () Bool)

(assert start!22376)

(declare-fun b!113078 () Bool)

(declare-fun res!93377 () Bool)

(declare-fun e!74200 () Bool)

(assert (=> b!113078 (=> (not res!93377) (not e!74200))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!113078 (= res!93377 (bvslt i!615 nBits!396))))

(declare-fun res!93372 () Bool)

(assert (=> start!22376 (=> (not res!93372) (not e!74200))))

(assert (=> start!22376 (= res!93372 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22376 e!74200))

(assert (=> start!22376 true))

(declare-datatypes ((array!5140 0))(
  ( (array!5141 (arr!2929 (Array (_ BitVec 32) (_ BitVec 8))) (size!2336 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4146 0))(
  ( (BitStream!4147 (buf!2744 array!5140) (currentByte!5324 (_ BitVec 32)) (currentBit!5319 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4146)

(declare-fun e!74202 () Bool)

(declare-fun inv!12 (BitStream!4146) Bool)

(assert (=> start!22376 (and (inv!12 thiss!1305) e!74202)))

(declare-fun b!113079 () Bool)

(declare-fun e!74199 () Bool)

(declare-fun e!74198 () Bool)

(assert (=> b!113079 (= e!74199 e!74198)))

(declare-fun res!93373 () Bool)

(assert (=> b!113079 (=> (not res!93373) (not e!74198))))

(declare-fun lt!171892 () (_ BitVec 64))

(declare-fun lt!171893 () (_ BitVec 64))

(assert (=> b!113079 (= res!93373 (= lt!171892 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171893)))))

(declare-datatypes ((Unit!6939 0))(
  ( (Unit!6940) )
))
(declare-datatypes ((tuple2!9304 0))(
  ( (tuple2!9305 (_1!4914 Unit!6939) (_2!4914 BitStream!4146)) )
))
(declare-fun lt!171894 () tuple2!9304)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113079 (= lt!171892 (bitIndex!0 (size!2336 (buf!2744 (_2!4914 lt!171894))) (currentByte!5324 (_2!4914 lt!171894)) (currentBit!5319 (_2!4914 lt!171894))))))

(assert (=> b!113079 (= lt!171893 (bitIndex!0 (size!2336 (buf!2744 thiss!1305)) (currentByte!5324 thiss!1305) (currentBit!5319 thiss!1305)))))

(declare-fun b!113080 () Bool)

(assert (=> b!113080 (= e!74200 (not (bvslt (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) (bvsub nBits!396 i!615))))))

(assert (=> b!113080 e!74199))

(declare-fun res!93371 () Bool)

(assert (=> b!113080 (=> (not res!93371) (not e!74199))))

(assert (=> b!113080 (= res!93371 (= (size!2336 (buf!2744 thiss!1305)) (size!2336 (buf!2744 (_2!4914 lt!171894)))))))

(declare-fun lt!171896 () Bool)

(declare-fun appendBit!0 (BitStream!4146 Bool) tuple2!9304)

(assert (=> b!113080 (= lt!171894 (appendBit!0 thiss!1305 lt!171896))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!113080 (= lt!171896 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113081 () Bool)

(declare-fun e!74197 () Bool)

(declare-datatypes ((tuple2!9306 0))(
  ( (tuple2!9307 (_1!4915 BitStream!4146) (_2!4915 Bool)) )
))
(declare-fun lt!171895 () tuple2!9306)

(assert (=> b!113081 (= e!74197 (= (bitIndex!0 (size!2336 (buf!2744 (_1!4915 lt!171895))) (currentByte!5324 (_1!4915 lt!171895)) (currentBit!5319 (_1!4915 lt!171895))) lt!171892))))

(declare-fun b!113082 () Bool)

(assert (=> b!113082 (= e!74198 e!74197)))

(declare-fun res!93376 () Bool)

(assert (=> b!113082 (=> (not res!93376) (not e!74197))))

(assert (=> b!113082 (= res!93376 (and (= (_2!4915 lt!171895) lt!171896) (= (_1!4915 lt!171895) (_2!4914 lt!171894))))))

(declare-fun readBitPure!0 (BitStream!4146) tuple2!9306)

(declare-fun readerFrom!0 (BitStream!4146 (_ BitVec 32) (_ BitVec 32)) BitStream!4146)

(assert (=> b!113082 (= lt!171895 (readBitPure!0 (readerFrom!0 (_2!4914 lt!171894) (currentBit!5319 thiss!1305) (currentByte!5324 thiss!1305))))))

(declare-fun b!113083 () Bool)

(declare-fun array_inv!2138 (array!5140) Bool)

(assert (=> b!113083 (= e!74202 (array_inv!2138 (buf!2744 thiss!1305)))))

(declare-fun b!113084 () Bool)

(declare-fun res!93375 () Bool)

(assert (=> b!113084 (=> (not res!93375) (not e!74198))))

(declare-fun isPrefixOf!0 (BitStream!4146 BitStream!4146) Bool)

(assert (=> b!113084 (= res!93375 (isPrefixOf!0 thiss!1305 (_2!4914 lt!171894)))))

(declare-fun b!113085 () Bool)

(declare-fun res!93374 () Bool)

(assert (=> b!113085 (=> (not res!93374) (not e!74200))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113085 (= res!93374 (validate_offset_bits!1 ((_ sign_extend 32) (size!2336 (buf!2744 thiss!1305))) ((_ sign_extend 32) (currentByte!5324 thiss!1305)) ((_ sign_extend 32) (currentBit!5319 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113086 () Bool)

(declare-fun res!93370 () Bool)

(assert (=> b!113086 (=> (not res!93370) (not e!74200))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113086 (= res!93370 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22376 res!93372) b!113085))

(assert (= (and b!113085 res!93374) b!113086))

(assert (= (and b!113086 res!93370) b!113078))

(assert (= (and b!113078 res!93377) b!113080))

(assert (= (and b!113080 res!93371) b!113079))

(assert (= (and b!113079 res!93373) b!113084))

(assert (= (and b!113084 res!93375) b!113082))

(assert (= (and b!113082 res!93376) b!113081))

(assert (= start!22376 b!113083))

(declare-fun m!169115 () Bool)

(assert (=> b!113085 m!169115))

(declare-fun m!169117 () Bool)

(assert (=> b!113084 m!169117))

(declare-fun m!169119 () Bool)

(assert (=> b!113081 m!169119))

(declare-fun m!169121 () Bool)

(assert (=> b!113083 m!169121))

(declare-fun m!169123 () Bool)

(assert (=> b!113082 m!169123))

(assert (=> b!113082 m!169123))

(declare-fun m!169125 () Bool)

(assert (=> b!113082 m!169125))

(declare-fun m!169127 () Bool)

(assert (=> b!113086 m!169127))

(declare-fun m!169129 () Bool)

(assert (=> b!113079 m!169129))

(declare-fun m!169131 () Bool)

(assert (=> b!113079 m!169131))

(declare-fun m!169133 () Bool)

(assert (=> start!22376 m!169133))

(declare-fun m!169135 () Bool)

(assert (=> b!113080 m!169135))

(check-sat (not b!113085) (not b!113082) (not b!113083) (not b!113086) (not b!113081) (not start!22376) (not b!113079) (not b!113080) (not b!113084))
(check-sat)
