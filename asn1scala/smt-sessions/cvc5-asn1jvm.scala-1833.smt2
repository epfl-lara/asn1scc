; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49230 () Bool)

(assert start!49230)

(declare-fun b!233832 () Bool)

(declare-fun e!161172 () Bool)

(declare-fun e!161166 () Bool)

(assert (=> b!233832 (= e!161172 e!161166)))

(declare-fun res!195617 () Bool)

(assert (=> b!233832 (=> (not res!195617) (not e!161166))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!369667 () (_ BitVec 64))

(assert (=> b!233832 (= res!195617 (bvsle bits!86 lt!369667))))

(declare-datatypes ((array!12091 0))(
  ( (array!12092 (arr!6292 (Array (_ BitVec 32) (_ BitVec 8))) (size!5305 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9706 0))(
  ( (BitStream!9707 (buf!5846 array!12091) (currentByte!10889 (_ BitVec 32)) (currentBit!10884 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9706)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233832 (= lt!369667 (bitIndex!0 (size!5305 (buf!5846 b2!99)) (currentByte!10889 b2!99) (currentBit!10884 b2!99)))))

(declare-fun b!233833 () Bool)

(declare-fun res!195620 () Bool)

(declare-fun e!161173 () Bool)

(assert (=> b!233833 (=> (not res!195620) (not e!161173))))

(declare-fun lt!369664 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233833 (= res!195620 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5305 (buf!5846 b2!99))) ((_ sign_extend 32) (currentByte!10889 b2!99)) ((_ sign_extend 32) (currentBit!10884 b2!99)) (bvsub bytes!19 lt!369664)))))

(declare-fun b!233834 () Bool)

(declare-fun res!195616 () Bool)

(declare-fun e!161174 () Bool)

(assert (=> b!233834 (=> (not res!195616) (not e!161174))))

(declare-fun b1!101 () BitStream!9706)

(assert (=> b!233834 (= res!195616 (= lt!369667 (bvadd (bitIndex!0 (size!5305 (buf!5846 b1!101)) (currentByte!10889 b1!101) (currentBit!10884 b1!101)) bits!86)))))

(declare-fun b!233836 () Bool)

(declare-fun e!161165 () Bool)

(assert (=> b!233836 (= e!161165 e!161173)))

(declare-fun res!195614 () Bool)

(assert (=> b!233836 (=> (not res!195614) (not e!161173))))

(declare-fun lt!369665 () (_ BitVec 64))

(declare-fun lt!369666 () (_ BitVec 64))

(declare-fun lt!369669 () (_ BitVec 64))

(assert (=> b!233836 (= res!195614 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369665 (bvsub lt!369669 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369665 lt!369669) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369666))))))

(assert (=> b!233836 (= lt!369665 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5305 (buf!5846 b2!99)))))))

(declare-fun b!233837 () Bool)

(declare-fun e!161170 () Bool)

(declare-fun array_inv!5046 (array!12091) Bool)

(assert (=> b!233837 (= e!161170 (array_inv!5046 (buf!5846 b1!101)))))

(declare-fun b!233838 () Bool)

(assert (=> b!233838 (= e!161166 e!161174)))

(declare-fun res!195619 () Bool)

(assert (=> b!233838 (=> (not res!195619) (not e!161174))))

(assert (=> b!233838 (= res!195619 (bvsle lt!369664 bytes!19))))

(assert (=> b!233838 (= lt!369664 ((_ extract 31 0) lt!369666))))

(assert (=> b!233838 (= lt!369666 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!233839 () Bool)

(declare-fun e!161168 () Bool)

(assert (=> b!233839 (= e!161168 e!161165)))

(declare-fun res!195612 () Bool)

(assert (=> b!233839 (=> (not res!195612) (not e!161165))))

(declare-fun lt!369668 () (_ BitVec 64))

(assert (=> b!233839 (= res!195612 (and (= lt!369667 lt!369669) (= (bvsub lt!369667 bits!86) lt!369668)))))

(assert (=> b!233839 (= lt!369669 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10889 b2!99))) ((_ sign_extend 32) (currentBit!10884 b2!99))))))

(declare-fun b!233840 () Bool)

(declare-fun res!195621 () Bool)

(assert (=> b!233840 (=> (not res!195621) (not e!161174))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233840 (= res!195621 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5305 (buf!5846 b1!101))) ((_ sign_extend 32) (currentByte!10889 b1!101)) ((_ sign_extend 32) (currentBit!10884 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!195618 () Bool)

(assert (=> start!49230 (=> (not res!195618) (not e!161172))))

(assert (=> start!49230 (= res!195618 (and (= (size!5305 (buf!5846 b1!101)) (size!5305 (buf!5846 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49230 e!161172))

(declare-fun inv!12 (BitStream!9706) Bool)

(assert (=> start!49230 (and (inv!12 b1!101) e!161170)))

(declare-fun e!161167 () Bool)

(assert (=> start!49230 (and (inv!12 b2!99) e!161167)))

(assert (=> start!49230 true))

(declare-fun b!233835 () Bool)

(assert (=> b!233835 (= e!161174 e!161168)))

(declare-fun res!195613 () Bool)

(assert (=> b!233835 (=> (not res!195613) (not e!161168))))

(assert (=> b!233835 (= res!195613 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5305 (buf!5846 b1!101)))) lt!369668) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233835 (= lt!369668 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10889 b1!101))) ((_ sign_extend 32) (currentBit!10884 b1!101))))))

(declare-fun b!233841 () Bool)

(assert (=> b!233841 (= e!161173 (and (bvslt lt!369666 #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt lt!369666 #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-fun b!233842 () Bool)

(assert (=> b!233842 (= e!161167 (array_inv!5046 (buf!5846 b2!99)))))

(declare-fun b!233843 () Bool)

(declare-fun res!195615 () Bool)

(assert (=> b!233843 (=> (not res!195615) (not e!161174))))

(assert (=> b!233843 (= res!195615 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5305 (buf!5846 b1!101))) ((_ sign_extend 32) (currentByte!10889 b1!101)) ((_ sign_extend 32) (currentBit!10884 b1!101)) bytes!19))))

(assert (= (and start!49230 res!195618) b!233832))

(assert (= (and b!233832 res!195617) b!233838))

(assert (= (and b!233838 res!195619) b!233843))

(assert (= (and b!233843 res!195615) b!233834))

(assert (= (and b!233834 res!195616) b!233840))

(assert (= (and b!233840 res!195621) b!233835))

(assert (= (and b!233835 res!195613) b!233839))

(assert (= (and b!233839 res!195612) b!233836))

(assert (= (and b!233836 res!195614) b!233833))

(assert (= (and b!233833 res!195620) b!233841))

(assert (= start!49230 b!233837))

(assert (= start!49230 b!233842))

(declare-fun m!356273 () Bool)

(assert (=> b!233843 m!356273))

(declare-fun m!356275 () Bool)

(assert (=> b!233842 m!356275))

(declare-fun m!356277 () Bool)

(assert (=> b!233837 m!356277))

(declare-fun m!356279 () Bool)

(assert (=> b!233834 m!356279))

(declare-fun m!356281 () Bool)

(assert (=> b!233832 m!356281))

(declare-fun m!356283 () Bool)

(assert (=> b!233840 m!356283))

(declare-fun m!356285 () Bool)

(assert (=> b!233833 m!356285))

(declare-fun m!356287 () Bool)

(assert (=> start!49230 m!356287))

(declare-fun m!356289 () Bool)

(assert (=> start!49230 m!356289))

(push 1)

(assert (not b!233843))

(assert (not b!233832))

(assert (not start!49230))

(assert (not b!233842))

(assert (not b!233834))

(assert (not b!233837))

(assert (not b!233840))

(assert (not b!233833))

(check-sat)

(pop 1)

(push 1)

(check-sat)

