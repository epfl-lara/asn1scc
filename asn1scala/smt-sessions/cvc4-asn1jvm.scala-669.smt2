; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18786 () Bool)

(assert start!18786)

(declare-fun b!93452 () Bool)

(declare-fun e!61373 () Bool)

(declare-datatypes ((array!4378 0))(
  ( (array!4379 (arr!2603 (Array (_ BitVec 32) (_ BitVec 8))) (size!1986 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3494 0))(
  ( (BitStream!3495 (buf!2356 array!4378) (currentByte!4698 (_ BitVec 32)) (currentBit!4693 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3494)

(declare-fun array_inv!1812 (array!4378) Bool)

(assert (=> b!93452 (= e!61373 (array_inv!1812 (buf!2356 bitStream2!8)))))

(declare-fun b!93453 () Bool)

(declare-fun res!77110 () Bool)

(declare-fun e!61375 () Bool)

(assert (=> b!93453 (=> (not res!77110) (not e!61375))))

(declare-fun bitStream1!8 () BitStream!3494)

(declare-fun isPrefixOf!0 (BitStream!3494 BitStream!3494) Bool)

(assert (=> b!93453 (= res!77110 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93454 () Bool)

(declare-fun e!61377 () Bool)

(declare-fun base!8 () BitStream!3494)

(assert (=> b!93454 (= e!61377 (array_inv!1812 (buf!2356 base!8)))))

(declare-fun b!93455 () Bool)

(declare-fun res!77113 () Bool)

(assert (=> b!93455 (=> (not res!77113) (not e!61375))))

(assert (=> b!93455 (= res!77113 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93456 () Bool)

(declare-fun res!77111 () Bool)

(assert (=> b!93456 (=> (not res!77111) (not e!61375))))

(declare-datatypes ((List!853 0))(
  ( (Nil!850) (Cons!849 (h!968 Bool) (t!1603 List!853)) )
))
(declare-fun listBits!13 () List!853)

(declare-fun length!444 (List!853) Int)

(assert (=> b!93456 (= res!77111 (> (length!444 listBits!13) 0))))

(declare-fun res!77109 () Bool)

(assert (=> start!18786 (=> (not res!77109) (not e!61375))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18786 (= res!77109 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18786 e!61375))

(assert (=> start!18786 true))

(declare-fun e!61374 () Bool)

(declare-fun inv!12 (BitStream!3494) Bool)

(assert (=> start!18786 (and (inv!12 bitStream1!8) e!61374)))

(assert (=> start!18786 (and (inv!12 bitStream2!8) e!61373)))

(assert (=> start!18786 (and (inv!12 base!8) e!61377)))

(declare-fun b!93457 () Bool)

(assert (=> b!93457 (= e!61375 false)))

(declare-fun lt!138461 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93457 (= lt!138461 (bitIndex!0 (size!1986 (buf!2356 bitStream2!8)) (currentByte!4698 bitStream2!8) (currentBit!4693 bitStream2!8)))))

(declare-fun lt!138462 () (_ BitVec 64))

(assert (=> b!93457 (= lt!138462 (bitIndex!0 (size!1986 (buf!2356 bitStream1!8)) (currentByte!4698 bitStream1!8) (currentBit!4693 bitStream1!8)))))

(declare-fun b!93458 () Bool)

(assert (=> b!93458 (= e!61374 (array_inv!1812 (buf!2356 bitStream1!8)))))

(declare-fun b!93459 () Bool)

(declare-fun res!77112 () Bool)

(assert (=> b!93459 (=> (not res!77112) (not e!61375))))

(assert (=> b!93459 (= res!77112 (and (= (buf!2356 bitStream1!8) (buf!2356 bitStream2!8)) (= (buf!2356 bitStream1!8) (buf!2356 base!8))))))

(declare-fun b!93460 () Bool)

(declare-fun res!77114 () Bool)

(assert (=> b!93460 (=> (not res!77114) (not e!61375))))

(assert (=> b!93460 (= res!77114 (bvslt (bitIndex!0 (size!1986 (buf!2356 base!8)) (currentByte!4698 base!8) (currentBit!4693 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93461 () Bool)

(declare-fun res!77115 () Bool)

(assert (=> b!93461 (=> (not res!77115) (not e!61375))))

(assert (=> b!93461 (= res!77115 (isPrefixOf!0 bitStream2!8 base!8))))

(assert (= (and start!18786 res!77109) b!93456))

(assert (= (and b!93456 res!77111) b!93455))

(assert (= (and b!93455 res!77113) b!93461))

(assert (= (and b!93461 res!77115) b!93453))

(assert (= (and b!93453 res!77110) b!93459))

(assert (= (and b!93459 res!77112) b!93460))

(assert (= (and b!93460 res!77114) b!93457))

(assert (= start!18786 b!93458))

(assert (= start!18786 b!93452))

(assert (= start!18786 b!93454))

(declare-fun m!137235 () Bool)

(assert (=> b!93461 m!137235))

(declare-fun m!137237 () Bool)

(assert (=> b!93454 m!137237))

(declare-fun m!137239 () Bool)

(assert (=> b!93457 m!137239))

(declare-fun m!137241 () Bool)

(assert (=> b!93457 m!137241))

(declare-fun m!137243 () Bool)

(assert (=> start!18786 m!137243))

(declare-fun m!137245 () Bool)

(assert (=> start!18786 m!137245))

(declare-fun m!137247 () Bool)

(assert (=> start!18786 m!137247))

(declare-fun m!137249 () Bool)

(assert (=> b!93452 m!137249))

(declare-fun m!137251 () Bool)

(assert (=> b!93456 m!137251))

(declare-fun m!137253 () Bool)

(assert (=> b!93455 m!137253))

(declare-fun m!137255 () Bool)

(assert (=> b!93453 m!137255))

(declare-fun m!137257 () Bool)

(assert (=> b!93458 m!137257))

(declare-fun m!137259 () Bool)

(assert (=> b!93460 m!137259))

(push 1)

(assert (not b!93456))

(assert (not b!93457))

(assert (not b!93460))

(assert (not b!93453))

(assert (not b!93452))

(assert (not start!18786))

(assert (not b!93458))

(assert (not b!93455))

(assert (not b!93454))

(assert (not b!93461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

