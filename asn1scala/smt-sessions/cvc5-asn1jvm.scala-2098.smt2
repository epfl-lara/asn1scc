; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53282 () Bool)

(assert start!53282)

(declare-fun res!206990 () Bool)

(declare-fun e!171328 () Bool)

(assert (=> start!53282 (=> (not res!206990) (not e!171328))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53282 (= res!206990 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53282 e!171328))

(assert (=> start!53282 true))

(declare-datatypes ((array!13478 0))(
  ( (array!13479 (arr!6895 (Array (_ BitVec 32) (_ BitVec 8))) (size!5908 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10738 0))(
  ( (BitStream!10739 (buf!6392 array!13478) (currentByte!11800 (_ BitVec 32)) (currentBit!11795 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10738)

(declare-fun e!171327 () Bool)

(declare-fun inv!12 (BitStream!10738) Bool)

(assert (=> start!53282 (and (inv!12 thiss!1005) e!171327)))

(declare-fun b!247339 () Bool)

(declare-fun e!171326 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247339 (= e!171326 (invariant!0 (currentBit!11795 thiss!1005) (currentByte!11800 thiss!1005) (size!5908 (buf!6392 thiss!1005))))))

(declare-fun b!247340 () Bool)

(declare-fun res!206991 () Bool)

(assert (=> b!247340 (=> (not res!206991) (not e!171328))))

(assert (=> b!247340 (= res!206991 (bvsge from!289 nBits!297))))

(declare-fun b!247341 () Bool)

(declare-fun res!206989 () Bool)

(assert (=> b!247341 (=> (not res!206989) (not e!171328))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247341 (= res!206989 (validate_offset_bits!1 ((_ sign_extend 32) (size!5908 (buf!6392 thiss!1005))) ((_ sign_extend 32) (currentByte!11800 thiss!1005)) ((_ sign_extend 32) (currentBit!11795 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247342 () Bool)

(assert (=> b!247342 (= e!171328 (not e!171326))))

(declare-fun res!206988 () Bool)

(assert (=> b!247342 (=> res!206988 e!171326)))

(assert (=> b!247342 (= res!206988 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10738 BitStream!10738) Bool)

(assert (=> b!247342 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17934 0))(
  ( (Unit!17935) )
))
(declare-fun lt!385821 () Unit!17934)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10738) Unit!17934)

(assert (=> b!247342 (= lt!385821 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun b!247343 () Bool)

(declare-fun array_inv!5649 (array!13478) Bool)

(assert (=> b!247343 (= e!171327 (array_inv!5649 (buf!6392 thiss!1005)))))

(assert (= (and start!53282 res!206990) b!247341))

(assert (= (and b!247341 res!206989) b!247340))

(assert (= (and b!247340 res!206991) b!247342))

(assert (= (and b!247342 (not res!206988)) b!247339))

(assert (= start!53282 b!247343))

(declare-fun m!373079 () Bool)

(assert (=> b!247339 m!373079))

(declare-fun m!373081 () Bool)

(assert (=> b!247343 m!373081))

(declare-fun m!373083 () Bool)

(assert (=> b!247342 m!373083))

(declare-fun m!373085 () Bool)

(assert (=> b!247342 m!373085))

(declare-fun m!373087 () Bool)

(assert (=> b!247341 m!373087))

(declare-fun m!373089 () Bool)

(assert (=> start!53282 m!373089))

(push 1)

(assert (not b!247341))

(assert (not b!247343))

(assert (not b!247342))

(assert (not start!53282))

(assert (not b!247339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82878 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82878 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5908 (buf!6392 thiss!1005))) ((_ sign_extend 32) (currentByte!11800 thiss!1005)) ((_ sign_extend 32) (currentBit!11795 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5908 (buf!6392 thiss!1005))) ((_ sign_extend 32) (currentByte!11800 thiss!1005)) ((_ sign_extend 32) (currentBit!11795 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20988 () Bool)

(assert (= bs!20988 d!82878))

(declare-fun m!373115 () Bool)

(assert (=> bs!20988 m!373115))

(assert (=> b!247341 d!82878))

(declare-fun d!82880 () Bool)

(assert (=> d!82880 (= (invariant!0 (currentBit!11795 thiss!1005) (currentByte!11800 thiss!1005) (size!5908 (buf!6392 thiss!1005))) (and (bvsge (currentBit!11795 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11795 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11800 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11800 thiss!1005) (size!5908 (buf!6392 thiss!1005))) (and (= (currentBit!11795 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11800 thiss!1005) (size!5908 (buf!6392 thiss!1005)))))))))

(assert (=> b!247339 d!82880))

(declare-fun d!82882 () Bool)

(assert (=> d!82882 (= (array_inv!5649 (buf!6392 thiss!1005)) (bvsge (size!5908 (buf!6392 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!247343 d!82882))

(declare-fun d!82884 () Bool)

(assert (=> d!82884 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11795 thiss!1005) (currentByte!11800 thiss!1005) (size!5908 (buf!6392 thiss!1005))))))

(declare-fun bs!20989 () Bool)

(assert (= bs!20989 d!82884))

(assert (=> bs!20989 m!373079))

(assert (=> start!53282 d!82884))

(declare-fun d!82886 () Bool)

(declare-fun res!207024 () Bool)

(declare-fun e!171358 () Bool)

(assert (=> d!82886 (=> (not res!207024) (not e!171358))))

(assert (=> d!82886 (= res!207024 (= (size!5908 (buf!6392 thiss!1005)) (size!5908 (buf!6392 thiss!1005))))))

(assert (=> d!82886 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!171358)))

(declare-fun b!247380 () Bool)

(declare-fun res!207022 () Bool)

(assert (=> b!247380 (=> (not res!207022) (not e!171358))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247380 (= res!207022 (bvsle (bitIndex!0 (size!5908 (buf!6392 thiss!1005)) (currentByte!11800 thiss!1005) (currentBit!11795 thiss!1005)) (bitIndex!0 (size!5908 (buf!6392 thiss!1005)) (currentByte!11800 thiss!1005) (currentBit!11795 thiss!1005))))))

(declare-fun b!247381 () Bool)

(declare-fun e!171359 () Bool)

(assert (=> b!247381 (= e!171358 e!171359)))

(declare-fun res!207023 () Bool)

(assert (=> b!247381 (=> res!207023 e!171359)))

(assert (=> b!247381 (= res!207023 (= (size!5908 (buf!6392 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247382 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13478 array!13478 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247382 (= e!171359 (arrayBitRangesEq!0 (buf!6392 thiss!1005) (buf!6392 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5908 (buf!6392 thiss!1005)) (currentByte!11800 thiss!1005) (currentBit!11795 thiss!1005))))))

(assert (= (and d!82886 res!207024) b!247380))

(assert (= (and b!247380 res!207022) b!247381))

(assert (= (and b!247381 (not res!207023)) b!247382))

(declare-fun m!373117 () Bool)

(assert (=> b!247380 m!373117))

(assert (=> b!247380 m!373117))

(assert (=> b!247382 m!373117))

(assert (=> b!247382 m!373117))

(declare-fun m!373119 () Bool)

(assert (=> b!247382 m!373119))

(assert (=> b!247342 d!82886))

(declare-fun d!82892 () Bool)

(assert (=> d!82892 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!385830 () Unit!17934)

(declare-fun choose!11 (BitStream!10738) Unit!17934)

(assert (=> d!82892 (= lt!385830 (choose!11 thiss!1005))))

(assert (=> d!82892 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!385830)))

(declare-fun bs!20994 () Bool)

(assert (= bs!20994 d!82892))

(assert (=> bs!20994 m!373083))

(declare-fun m!373125 () Bool)

(assert (=> bs!20994 m!373125))

(assert (=> b!247342 d!82892))

(push 1)

(assert (not d!82892))

(assert (not d!82884))

(assert (not d!82878))

(assert (not b!247382))

(assert (not b!247380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

